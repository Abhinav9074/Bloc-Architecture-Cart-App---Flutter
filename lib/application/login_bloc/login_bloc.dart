import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/login_bloc/login_event.dart';
import 'package:mini_project/application/login_bloc/login_state.dart';
import 'package:mini_project/domain/api/api_calling/api_functions.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(LoginInitialState()){
    
    on<LoginButtonClickEvent>((event, emit)async{
      emit(LoginLoadingState());
      final response = await login(event.userName, event.password);
      if(response.statusCode == 401){
        emit(LoginFailedState(response.body));
      }else if(response.statusCode == 200){
        emit(LoginSuccessState());
      }
    });
  }
}