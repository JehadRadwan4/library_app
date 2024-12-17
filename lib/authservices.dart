import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';


class auth_services{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  
  //get current user
  User?getCurrentUser(){
    return auth.currentUser;
  }
  //sign in 
  Future<UserCredential> signInWithEmailAndPassword(String email,String password)async{
    try{
    UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
     
     
     //save user info in a separwte doc
     firestore.collection("Users").doc(userCredential.user!.uid).set({
      'uid':userCredential.user!.uid,
      'email':email,
     });
    
   /*   firestore.collection("Users").add({
            'email':email,
            'pass':password,
            
          });  */

     return userCredential;
  }
  on FirebaseAuthException catch(e){
    throw Exception(e.code);

  }
  }

  //sign out
  Future <void> signout()async{
    return await auth.signOut();
  }
  //sign up
  Future<UserCredential> signUnWithEmailAndPassword(String email,String password,String nickname,String phone)async{
    try{
    UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);
     

    
     
     //save user info in a separwte doc
     firestore.collection("Users").doc(userCredential.user!.uid).set({
      'uid':userCredential.user!.uid,
      'email':email,
    
      'nickname':nickname,
      'phone':phone,
     });
    
    
    
     return userCredential;
  }
  on FirebaseAuthException catch(e){
    throw Exception(e.code);

  
  }}
}