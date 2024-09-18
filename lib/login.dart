import 'package:fb_db/auth%20change.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await FirebaseAuth.instance.signInAnonymously().then((value){
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context)=>AuthChange())
              );
            });
          },
          child: Text("Anonymously"),
        ),
      ),
    );
  }
}
