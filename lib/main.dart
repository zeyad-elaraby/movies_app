import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/film_play_screen.dart';
import 'package:movies_app/tabs/search_tab.dart';

import 'home_screen.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen(),
        FilmPlayScreen.routeName:(context)=>FilmPlayScreen(),
        SearchTab.routeName:(context)=>SearchTab(),
      }

    );
  }
}