import 'package:flutter/material.dart';

class Text_page extends StatelessWidget {
   final String? text;
   Text_page({this.text});


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 90, 148, 92),leading:  IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back)),),
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
         
          
           Container(
            
          padding: EdgeInsets.only(top: 100,left: 8),
              child: 
            Text( text!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),textAlign: TextAlign.left,),),
        
        ],
      ),
    );
  }
}