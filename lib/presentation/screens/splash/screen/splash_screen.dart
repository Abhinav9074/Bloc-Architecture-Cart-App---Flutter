import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/splash_bloc/splash_bloc.dart';
import 'package:mini_project/application/splash_bloc/splash_state.dart';
import 'package:mini_project/presentation/screens/login/screen/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc,SplashState>(
      listener: (context,state){
        if(state is SplashLoadedState){
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> LoginScreen()));
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/load.gif'),
        ),
      ),
      );
  }
}
