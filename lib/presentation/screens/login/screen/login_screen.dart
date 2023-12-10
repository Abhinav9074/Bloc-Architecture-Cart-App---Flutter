// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/login_bloc/login_bloc.dart';
import 'package:mini_project/application/login_bloc/login_event.dart';
import 'package:mini_project/application/login_bloc/login_state.dart';
import 'package:mini_project/presentation/screens/home/screen/home_screen.dart';
import 'package:mini_project/presentation/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async{
          if (state is LoginFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage,style: MyTextStyle.buttonText,),backgroundColor: Colors.red,behavior: SnackBarBehavior.floating,));
          }
          if (state is LoginSuccessState) {
            await setLogin();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success',style: MyTextStyle.buttonText,),backgroundColor: Color.fromARGB(255, 3, 87, 28),behavior: SnackBarBehavior.floating,));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const HomeScreen()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter Your Credentials',
                    style: MyTextStyle.commonText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
                    child: TextFormField(
                      onChanged: (val) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a UserName";
                        } else {
                          return null;
                        }
                      },
                      controller: userNameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("Email")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    child: TextFormField(
                      onChanged: (val) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a Password";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Password")),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return const CircularProgressIndicator();
                          } else {
                            return CupertinoButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginButtonClickEvent(
                                          userNameController.text,
                                          passwordController.text));
                                }
                              },
                              color: Colors.black,
                              child: const Text(
                                'Log In',
                                style: MyTextStyle.buttonText,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            )),
          );
        },
      ),
    );
  }
  Future<void>setLogin()async{
    final instance = await SharedPreferences.getInstance();
    await instance.setBool('Login', true);
  }
}
