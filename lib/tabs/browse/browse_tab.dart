import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/apis/api_manager/api_manager.dart';
import 'package:movies_app/category_film_list.dart';
import 'package:movies_app/film_play_screen.dart';

import '../../items/category_item.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({super.key});
  List<String> categoriesImages = [
    "assets/images/Deadpool And Wolverine 5k 2024.jpeg",
    "assets/images/adventure.jpg",
    "assets/images/despicable-me.jpg",
    "assets/images/comedy.jpg",
    "assets/images/Trap_ No Way Out.jpeg",
    "assets/images/apolo13_survival.jpeg",
    "assets/images/THE_CONVERT_image.jpg",
    "assets/images/harold_and_the_purple_crayon.jpg",
    "assets/images/beetle_Juice.jpg",
    "assets/images/oppenheimer-header.jpg",
    "assets/images/alien-romulus-poster-.jpg",
    "assets/images/trollsbt.jpg",
    "assets/images/Movie-Oddity-Stars-Gwilym-Lee-and-Carolyn-Bracken-Talk-Scary-Roles-and-Possible-Sequel-4-2048x1026.jpeg",
    "assets/images/romance.jpg",
    "assets/images/science_fiction.jpg",
    "assets/images/tv_movie.jpg",
    "assets/images/thriller.jpg",
    "assets/images/war.jpg",
    "assets/images/western.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getMoviesList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("somthing went wrong");
        } else if (snapshot.hasData) {
          var genres = snapshot.data?.genres ?? [];
          if (genres.isEmpty) {
            return Text("no categories to browse");
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Browse Category ",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 16 / 9),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CategoryFilmList.routeName,
                                  arguments: genres[index]);
                            },
                            child: CategoryItem(
                              id: genres[index].id ?? 0,
                              name: genres[index].name ?? "",
                              image: categoriesImages[index],
                            ));
                      },
                      itemCount: genres.length,
                    ),
                  ),
                )
              ],
            );
          }
        } else {
          return Text("no categories to browse");
        }
      },
    );
  }
}
