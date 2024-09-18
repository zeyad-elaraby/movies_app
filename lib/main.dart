import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/category_film_list.dart';
import 'package:movies_app/film_play_screen.dart';
import 'package:movies_app/tabs/browse/browse_tab.dart';
import 'package:movies_app/tabs/search_tab/search_tab.dart';

import 'firebase_options.dart';
import 'home_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        CategoryFilmList.routeName:(context)=>CategoryFilmList(),

      }

    );
  }
}