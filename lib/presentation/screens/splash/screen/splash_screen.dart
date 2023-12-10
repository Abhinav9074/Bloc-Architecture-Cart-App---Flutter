import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/splash_bloc/splash_bloc.dart';
import 'package:mini_project/application/splash_bloc/splash_state.dart';
import 'package:mini_project/presentation/screens/home/screen/home_screen.dart';
import 'package:mini_project/presentation/screens/login/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  late final LoginState;
  @override
  Widget build(BuildContext context) {
    checkLogin();
    return BlocListener<SplashBloc,SplashState>(
      listener: (context,state){
        if(state is SplashLoadedLoginState){
           if(LoginState==true){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const HomeScreen()));
           }else{
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> LoginScreen()));
           }
        }
          
      },
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/load.gif'),
        ),
      ),
      );
  }
  Future<void>checkLogin()async{
    final shared = await SharedPreferences.getInstance();
    LoginState = shared.getBool('Login');
  }

}
