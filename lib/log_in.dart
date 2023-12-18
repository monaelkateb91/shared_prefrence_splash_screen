import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrence_splash_screen/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: usernamecontroller,
              decoration: InputDecoration(hintText: 'username'),
              obscureText: false,
            ),
            SizedBox(),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(hintText: 'password'),
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
                child: Text("Sign in"),
                color: Colors.red,
                onPressed: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('username', usernamecontroller.text.toString());
                  sp.setString('password', passwordcontroller.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                }),
          ],
        ),
      ),
    );
  }
}
