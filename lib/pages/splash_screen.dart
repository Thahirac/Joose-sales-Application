import 'dart:async';
import 'package:flutter/material.dart';
import 'package:joosesales/cubit/authentication/auth_cubit.dart';
import 'package:joosesales/repository/authenticationRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dash_board.dart';
import 'login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  final splashDelay = 3;
  late AuthenticationCubit authCubit;

  String? version;
  @override
  void initState() {
    super.initState();
    authCubit = AuthenticationCubit(
        AuthenticationIntial(), UserAuthenticationRepository());
    Timer(Duration(seconds: 3), () {
      authCubit.getAuthenticationState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
          create: (context) => authCubit,
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return Dashboard();
                } else if (state is UnAuthenticated) {
                  return  Login();
                } else {
                  // package();
                  return Splachform();
                }
              })),
    );
  }


  Widget Splachform() {
    return Center(
      child: Image.asset(
        "assets/images/logowwletter1.png",
        height: 160.0,
        width: 160.0,
      ),
    );
  }

}


