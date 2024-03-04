import 'package:flutter/material.dart';
import 'package:todo_app/home_page.dart';
import 'package:todo_app/reg_page.dart';

class Lgpg extends StatefulWidget {
  const Lgpg({super.key});

  @override
  State<Lgpg> createState() => _LgpgState();
}

class _LgpgState extends State<Lgpg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.black),
        ),
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset("assets/login page img.jpg"),
          SizedBox(
            height: 20,
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            labelText: "Username/Email",
            hintText: "Enter Your Username/Email"
          ),
        ),
      ),
      SizedBox(
        height: 12,
      ),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            labelText: "Password",
            hintText: "Enter Your password"
          ),
               ),
       ),

       Padding(
        padding: const EdgeInsets.fromLTRB(200, 10, 0, 0),
        child: TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Rgpg()
          )
          );
        },
         child: Text("Register?")),
      ),
       SizedBox(
        height: 10,
       ),
       ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(200, 10),
           foregroundColor: Color.fromARGB(255, 162, 54, 244),
        ),
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Hmpg()));
        },
        child: Text("Login",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
        )
        ),
      ],
      ),
    ),
    );
  }
}