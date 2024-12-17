import 'package:final_project/DetailScreen.dart';
import 'package:final_project/authservices.dart';
import 'package:final_project/home.dart';
import 'package:final_project/login.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  
  final  void Function ()?onTap;
  register({super.key,this.onTap});
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late String email,password,confirm,nickname;
  late String phone;


  void registerr(BuildContext context){
    final authservice=auth_services();
    
    if(password==confirm){
      try {
        authservice.signUnWithEmailAndPassword(email, password,nickname,phone);
    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()), // Correct format
);
        
      
      } catch (e) {
        showDialog(context: context, builder: (context)=>AlertDialog(title: Text(e.toString()),));
      }
    }

    else{
      showDialog(context: context, builder: (context)=>AlertDialog(title: Text("Password don't match"),));
    }
  }
  @override
  Widget build(BuildContext context) {
   double height=MediaQuery.of(context).size.height;
   double width=MediaQuery.of(context).size.width;
    return Scaffold(
    body: Stack(
      children: [
        Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.png"), // Ensure the asset exists
                  fit: BoxFit.cover,
                ),
              ),
            ),
        
        
        
        Center(
        child: ListView(children: [
          
           
        
          SizedBox(height: height*0.04,),
          SizedBox(height: height*0.04,),
           Container(
             alignment: Alignment.center,
            child: Text("Let's Get Started",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
           
    
         
           Container(
            alignment: Alignment.center,
            child: Text("create an account to get all features",style: TextStyle(color: Colors.grey,fontSize: 16),)),
              SizedBox(height: height*0.04,),
               SizedBox(height: height*0.04,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(
                 onChanged: (value) {
              nickname=value;
            },
                decoration: InputDecoration(
                fillColor:const Color.fromARGB(255, 192, 149, 163),
                filled: true,
                hintText: "Nick name",prefixIcon: Icon(Icons.person,color: Colors.white,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white)
                )
             
             
               ),),
             ),
            SizedBox(height: height*0.02,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(
                 onChanged: (value) {
              email=value;
            },
                decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 192, 149, 163),
                filled: true,
                hintText: "Email",prefixIcon: Icon(Icons.email,color: Colors.white,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white)
                )
             
             
               ),),
             ),
    
               SizedBox(height: height*0.02,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(obscureText: true,
                 onChanged: (value) {
              password=value;
            },
                decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 192, 149, 163),
                filled: true,
                hintText: "Password",prefixIcon: Icon(Icons.key,color: Colors.white,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white)
                )
             
             
               ),),
             ),
    
               SizedBox(height: height*0.02,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(obscureText: true,
                 onChanged: (value) {
              confirm=value;
            },
                decoration: InputDecoration(
                fillColor:const Color.fromARGB(255, 192, 149, 163),
                filled: true,
                hintText: "Confirm Password",prefixIcon: Icon(Icons.lock,color: Colors.white,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white)
                )
             
             
               ),),
             ),
    
              SizedBox(height: height*0.02,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(
                 onChanged: (value) {
              phone=value;
            },
                decoration: InputDecoration(
                fillColor:const Color.fromARGB(255, 192, 149, 163),
                filled: true,
                hintText: "Phone",prefixIcon: Icon(Icons.phone,color: Colors.white,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white)
                )
             
             
               ),),
             ),
    
    
             SizedBox(height: height*0.04,), 
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: MaterialButton(onPressed: (){registerr(context); },child:Text("Create",style: TextStyle(color: Colors.white,fontSize: 18),),color:Color.fromARGB(255, 141, 96, 111),padding: EdgeInsets.only(right: 80,left:80),shape: StadiumBorder(),),
                  )
             ,SizedBox(height: height*0.04,),
            
    
               Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Text("Already have an account?",style: TextStyle(fontSize: 15),),
            GestureDetector(onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            },child:Text("Sign in!",style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 141, 96, 111),fontSize: 18),), ),
          ],)
        
        
        ],),
      ),
    ]),






    );
  }
}