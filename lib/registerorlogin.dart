import 'package:final_project/login.dart';
import 'package:final_project/register.dart';
import 'package:flutter/material.dart';

class registrorlogin extends StatefulWidget {
  const registrorlogin({super.key});

  @override
  State<registrorlogin> createState() => _registrorloginState();
}

class _registrorloginState extends State<registrorlogin> {
  bool showloginpage=true;

  void togglePages(){
    setState(() {
      showloginpage=!showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showloginpage){
      return login(onTap: togglePages);
      
    }
    else{
      return register(onTap:togglePages);
    }

  }
}