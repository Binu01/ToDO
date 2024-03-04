import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class prfltab extends StatefulWidget {
  const prfltab({super.key});

  @override
  State<prfltab> createState() => _prfltabState();
}

class _prfltabState extends State<prfltab> {
  @override
 
  ImagePicker _picker = ImagePicker();
  XFile? _image;
  
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/profileimg.png"))
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 64,
                    top: 67,
                    child: IconButton(
                    onPressed: ()async{
                      _image = await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                      
                      });
                    },
                   icon: Icon(Icons.add_a_photo)
                   ),
                   ),
                ],
              ),
            ),
      
             _image == null?Container(
              height: 20,
              width: 50,
             ): Image.file(File(_image!.path)),
      
  
            SizedBox(
              height: 30,
            ),
            Text("name:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             SizedBox(
              height: 30,
            ),
            Text("Email:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             SizedBox(
              height: 30,
            ),
            Text("Phone No:",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    ),
    );
  }
}