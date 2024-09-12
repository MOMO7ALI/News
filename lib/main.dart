import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/news_Details.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.routeName : (context) => HomeScreen(),
        NewsDetails.routeName : (context) => NewsDetails(),
      } ,
      initialRoute: HomeScreen.routeName,

    );
  }
}