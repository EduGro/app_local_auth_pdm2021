part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class AccountSavedState extends ProfileState {}

class AccountLoadedState extends ProfileState {
  //TODO: desde el Bloc pasar aqui la lista de objetos para usar los datos y pintar la UI
}

class AccountLoadingState extends ProfileState {}

class AccountErrorState extends ProfileState {
  final String errorMsg;

  AccountErrorState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class AccountNewImageState extends ProfileState {
  final File image;

  AccountNewImageState({@required this.image});
  @override
  List<Object> get props => [image];
}

class AccountAuthState extends ProfileState {
  //indicar en ui si se autentico el user y abrir pantalla de tarjetas
}
