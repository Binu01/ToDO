import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:todo_app/functions/fns.dart';


class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {


   final SnackBar _bar = SnackBar(
    content: Text("Details successflly Added"),
    duration:Duration(seconds: 3),
   );

  TextEditingController _agectrl = TextEditingController();
  TextEditingController _namectrl = TextEditingController();

  void Submitdetails() async{
    String Id = randomAlphaNumeric(10);
    Map<String, dynamic>detailsInfoMap = {
      'name': _namectrl.text,
      'id': Id,
      'age': _agectrl.text,
    };
    await Methods().addDetails(detailsInfoMap, Id)
        .then((value) {

      // Fluttertoast.showToast(
      //     msg: "Employee details has been uploaded successfully",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
    }
    );

    
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Text("details",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Container(
          height: 300,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _namectrl,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _agectrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter your Age",
                  labelText: "Age",

                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    ),
                    onPressed: () {
                      Submitdetails();
                        ScaffoldMessenger.of(context).showSnackBar(_bar);
                      Navigator.pop(context);
                    },
                    child: Text("Add", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),)
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
