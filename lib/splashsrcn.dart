import 'package:flutter/material.dart';
import 'package:todo_app/login_page.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tohome();
  }
  
Tohome()async{
  await Future.delayed(Duration(seconds: 2),(){}
  );
  Navigator.pushReplacement(context,
   MaterialPageRoute(builder: (context)=>Lgpg())
   );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/splash icon.png",color: Color.fromARGB(255, 4, 215, 234),),
            ),
            Text("ToDo",style: TextStyle(fontSize:30,color: Color.fromARGB(255, 0, 249, 21))),
          ],
        ),
      ),
    );
  }
}

//  animated_splash_screen: