abstract class LoginEvent {}


class LoginButtonClickEvent extends LoginEvent{
  final String userName;
  final String password;
  LoginButtonClickEvent(this.userName,this.password);
}
