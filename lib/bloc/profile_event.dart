part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class SaveAccounteEvent extends ProfileEvent {
  //TODO: indicar aqui el objeto account para pasarlo al bloc y que lo guardar de la bd
}

class RemoveAccountEvent extends ProfileEvent {
  //TODO: indicar aqui el objeto account para pasarlo al bloc y que lo borre de la bd}
}

class LoadAccountsEvent extends ProfileEvent {
  //TODO: indical al bloc que consulte las cuentas de la bd
}

class ChangeAccountImageEvent extends ProfileEvent {}

class UserAccountAuthEvent extends ProfileEvent {}
