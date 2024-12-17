import 'package:final_project/DetailScreen.dart';
import 'package:final_project/authgate.dart';
import 'package:final_project/authservices.dart';
import 'package:final_project/home.dart';
import 'package:final_project/login.dart';
import 'package:final_project/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final navigatorKey=GlobalKey<NavigatorState>();
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase Initialization Error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: authgate()
    );
  }
}

