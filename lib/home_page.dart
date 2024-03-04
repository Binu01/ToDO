import 'package:flutter/material.dart';
import 'package:todo_app/tabs/details_tab.dart';
import 'package:todo_app/tabs/home_tab.dart';
import 'package:todo_app/tabs/profile_tab.dart';

class Hmpg extends StatefulWidget {
  const Hmpg({super.key});

  @override
  State<Hmpg> createState() => _HmpgState();
}

class _HmpgState extends State<Hmpg> {
  @override

int _indexno = 0;

List Tabs =[
  hmtab(),
  dtltab(),
  prfltab(),
            ];


  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor:Colors.yellowAccent,
   title: Text("ToDo",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color.fromARGB(216, 29, 224, 254)),),
   centerTitle: true),
  drawer: Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
            accountName:Text("Name:") ,
            accountEmail: Text("Email:"),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage("assets/profileimg.png"),
        ),
        ),
        ListTile(
          title: Text("settings",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          onTap: (){},
        )
      ],
    ),
  ),

   bottomNavigationBar: BottomNavigationBar(items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_outlined),
      label: 'details',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'profile',
    ),
   ],
   showUnselectedLabels: false,
   iconSize: 25,
   currentIndex: _indexno,
   onTap: (int num){
    setState(() {
      _indexno = num;
    });
   },
   ),
  body: Tabs.elementAt(_indexno),
    );
  }
}
