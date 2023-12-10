// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mini_project/presentation/screens/login/screen/login_screen.dart';
import 'package:mini_project/presentation/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(onPressed: ()async{
          await logOut();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => LoginScreen())));
        }, icon: const Icon(Icons.logout)),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Home',style: MyTextStyle.buttonText,),
      ),
      body: const Center(child: Text('Home')),
    );
  }
  Future<void>logOut()async{
    final shared = await SharedPreferences.getInstance();
    shared.setBool('Login', false);
  }
}