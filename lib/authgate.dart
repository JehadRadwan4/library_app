import 'package:final_project/DetailScreen.dart';
import 'package:final_project/home.dart';
import 'package:final_project/registerorlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class authgate extends StatelessWidget {
  const authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: StreamBuilder(builder: (context,snapshot){
      if(snapshot.hasData){
        return HomeScreen();
      }

      else{
        return registrorlogin();
      }
    },
    stream: FirebaseAuth.instance.authStateChanges(),
   ),



    );
  }
}