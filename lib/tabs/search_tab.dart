import 'package:flutter/material.dart';

import '../items/searched_movie_item.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E1E),
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF514F4F),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Color(0xFF9b9c9b)),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9b9c9b)),
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9b9c9b)),
                  borderRadius: BorderRadius.circular(35))),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/movie_icon.png"),
                Text("No movies found",style: TextStyle(color: Color(0xFFb2b2b2)),),

                 //Todo : i will use SearchedMovieItem when i search about movies
              ],
            ),
          )
        ],
      ),
    );
  }
}
