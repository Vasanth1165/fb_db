
import 'package:fb_db/login.dart';
import 'package:fb_db/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthChange extends StatefulWidget {
  const AuthChange({super.key});

  @override
  State<AuthChange> createState() => _AuthChangeState();
}

class _AuthChangeState extends State<AuthChange> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snap){
          if(snap.hasData){
            return HomePage();
          }else{
            return LoginPage();
          }
        });
  }
}
