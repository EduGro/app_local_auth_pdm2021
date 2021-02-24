import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ChangeAccountImageEvent) {
      try {
        File img = await _pickImage();
        yield AccountNewImageState(image: img);
      } catch (e) {
        yield AccountErrorState(errorMsg: "No se pudo cargar la imagen");
      }
    } else if (event is UserAccountAuthEvent) {
      if (await _checkBiometrics()) {
        bool authenticated = await _authentication();
        yield authenticated
            ? UserAccountAuthEvent()
            : AccountErrorState(errorMsg: "No se pudo autenticar");
      } else {
        yield AccountErrorState(
            errorMsg: "No existen sensores para autenticar");
      }
    }
  }

  Future<File> _pickImage() async {
    final picker = ImagePicker();
    final PickedFile choosenImage = await picker.getImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return File(choosenImage.path);
  }

  Future<bool> _checkBiometrics() async {
    try {
      //List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      //print(availableBiometrics);
      return await _localAuth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _authentication() async {
    try {
      return await _localAuth.authenticateWithBiometrics(
        localizedReason: "Autentiquese!",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      print(e);
      return false;
    }
  }
}
