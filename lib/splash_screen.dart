import 'dart:async';


import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence_splash_screen/home.dart';
import 'package:shared_prefrence_splash_screen/log_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin =
        sp.getBool('islogin') ?? false; // ??check if a variable is null
    if (isLogin) {
      Timer(Duration(seconds: 5), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    } else {
      Timer(Duration(seconds: 5),(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())); });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.grey,Colors.redAccent])
      ),
      child: Column(mainAxisAlignment:MainAxisAlignment.center, children: [Icon(Icons.hourglass_bottom,size: 80,color: Colors.white,),],),
    ),);
  }
}
