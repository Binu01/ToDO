import 'package:flutter/material.dart';
import 'package:todo_app/login_page.dart';

class Rgpg extends StatefulWidget {
  const Rgpg({super.key});

  @override
  State<Rgpg> createState() => _RgpgState();
}

class _RgpgState extends State<Rgpg> {

final SnackBar Bar = SnackBar(
    content: Text("Successfully Registered, You may now login"),
    duration:Duration(seconds: 3),
  );

final _valdkey = GlobalKey<FormState>();


  @override

 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text("Register",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Form(
        key: _valdkey,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(

                 validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: "Email",
                  hintText: "Enter Your Email",
                ),
              ),
            ),
        
            SizedBox(
              height: 10,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(

               validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },  

                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: "Password",
                  hintText: "Enter Your Password",
                ),
              ),
            ),
        
            SizedBox(
              height: 10,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(

               validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Required';
                      }
                      return null;
                    },

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: "Mobile ",
                  hintText: "Enter Your Mobile No.",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(152, 20, 0, 0),
              child: TextButton(onPressed: (){
      
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Lgpg()
                )
                );
                 
              },
               child: Text("Already have an account?")),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 20),
                foregroundColor: Color.fromARGB(255, 162, 54, 244),
              ),
              onPressed: (){
               if (_valdkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(Bar);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Lgpg(),
                          )
                      );
                    }
              },
             child: Text("Register",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             )
          ],
        ),
      ),
    );
  }
}