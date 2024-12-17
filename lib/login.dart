import 'package:final_project/authservices.dart';
import 'package:final_project/home.dart';
import 'package:final_project/register.dart';
import 'package:flutter/material.dart';


class login extends StatelessWidget {
final  void Function ()?onTap;
late String Email;
late String Password;
 
void loginn(BuildContext context) async{
  final auth_service=auth_services();
  try {
    await auth_service.signInWithEmailAndPassword(Email, Password);
    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()), // Correct format
);
    
    
  } catch (e) {
    showDialog(context: context, builder: (context)=>AlertDialog(title: Text(e.toString()),));
  }
}



  login({super.key,this.onTap});
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
        
        child: ListView(
      padding: EdgeInsets.only(top: 200),
          children: [
        
      
           Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),textAlign: TextAlign.center,),
           
    
         
           Container(
            alignment: Alignment.center,
            child: Text("Log in into your existing account",style: TextStyle(color: Colors.grey,fontSize: 16),)),
              SizedBox(height: height*0.04,),
               SizedBox(height: height*0.04,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(
                 onChanged: (value) {
              Email=value;
            },
                decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 192, 149, 163),
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
             SizedBox(height: height*0.04,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: TextFormField(obscureText: true,
                onChanged: (value) {
              Password=value;
            },
                decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 192, 149, 163),
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
             SizedBox(height: height*0.04,), 
             SizedBox(height: height*0.04,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: MaterialButton(onPressed: (){  loginn(context);},child:Text("Log in",style: TextStyle(color: Colors.white,fontSize: 18),),color:Color.fromARGB(255, 141, 96, 111),padding: EdgeInsets.only(right: 80,left:80),shape: StadiumBorder(),),
                  )
             ,SizedBox(height: height*0.04,),
             SizedBox(height: height*0.04,),
    
               Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Text("Not a member?",style: TextStyle(fontSize: 15),),
            GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
            },child:Text("Register Now!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:Color.fromARGB(255, 141, 96, 111),),), ),
          ],)
        
        
        ],),
      ),
    ]),






    );
  }
}