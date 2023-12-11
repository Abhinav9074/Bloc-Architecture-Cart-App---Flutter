import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/cart_bloc/cart_bloc.dart';
import 'package:mini_project/application/splash_bloc/splash_bloc.dart';
import 'package:mini_project/presentation/screens/splash/screen/splash_screen.dart';
import 'package:mini_project/presentation/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: myTheme,
        home: BlocProvider(
          create: (context) => SplashBloc(),
          child: SplashScreen(),
        ),
      ),
    );
  }
}
