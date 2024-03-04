import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Add_details_page.dart';
import 'package:todo_app/functions/fns.dart';

class dtltab extends StatefulWidget {
  const dtltab({super.key});

  @override
  State<dtltab> createState() => _dtltabState();
}

class _dtltabState extends State<dtltab> {

  TextEditingController _namectrl = TextEditingController();
  TextEditingController _agectrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>Add())
      );
      },
      child: Icon(Icons.add)
      ),
      
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("details").snapshots(),
          builder: (context,AsyncSnapshot snap){
            if (snap.hasData){
              return ListView.builder(
                  itemCount: snap.data.docs.length,
                  itemBuilder: (BuildContext context,int index){
                    final  DocumentSnapshot ds = snap.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            child: Column(
                              children: [
                          Text(ds["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),
                          ),
                         Text(ds['age'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red),
                         ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  IconButton(
                                      color: Colors.grey,
                                      iconSize: 40,
                                      onPressed: (){
                                    _namectrl.text = ds['name'];
                                    _agectrl.text = ds['age'];
                                    EditDetails(ds["id"]);

                                  },
                                      icon: Icon(Icons.edit)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    color: Colors.grey,
                                      iconSize: 40,
                                      onPressed: ()async{
                                    await Methods().deleteDetails(ds['id']);
                                  },
                                      icon: Icon(Icons.delete))
                                ],)
                              ],
                            ),

                          ),

                        ),
                      ),

                    );

                  }
              );
            }
            return Container();
          }
      )
    );
  }
  Future EditDetails(String id)=> showDialog(
      context: context,
      builder: (BuildContext context)=>AlertDialog(
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Text("Edit Details",style: TextStyle(color: Colors.blue,
                      fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Name",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.bold )),

              SizedBox(
                height: 10.0,
              ),

              Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: _namectrl,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Age",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.bold )),

              SizedBox(
                height: 10.0,
              ),

              Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: _agectrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  )
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                  height: 35,
                  width: 300,
                  child: ElevatedButton(onPressed: () async{

                    Map<String,dynamic>updateInfo={
                      "name":_namectrl.text,
                      "age":_agectrl.text,
                      "id":id,

                    };
                    await Methods().updateDetails(id, updateInfo).then((value) {
                      Navigator.pop(context);
                    }
                    );
                  },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange
                      ),
                      child: Text("Update",style: TextStyle(color: Colors.white),)
                  )
              )
            ],
          ),
        ),
      )
  );
}
