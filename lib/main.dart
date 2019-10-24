import 'package:app_two/UserInterface/menudashboard.dart';
import 'package:flutter/material.dart';
//import './UserInterface/home.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner:false ,
      title: 'Nagarro Timisoara',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      home: MenuDashboard(),
    );
  } 
}