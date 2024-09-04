import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'items/category_chip.dart';
import 'items/film_item.dart';
import 'movie_suggession_List.dart';

class FilmPlayScreen extends StatelessWidget {
  static const String routeName = "FilmPlayScreen";
  const FilmPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E1D),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dora and the lost city of gold",
          style: GoogleFonts.inter(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF1D1E1D),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [
                Image(
                    image: AssetImage(
                  "assets/images/stack_film_Background_home.png",
                )),
                //,height: 217,width:  412,
                Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Image(
                            image:
                                AssetImage("assets/images/play-button.png")))),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dora and the lost city of gold",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "2019  PG-13  2h 7m",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilmItem(
                        filmImage: "assets/images/film_image.png",
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CategoryChip(
                                  text: 'crime',
                                ),
                                SizedBox(width: 3,),
                                CategoryChip(
                                  text: 'drama',
                                ),
                                SizedBox(width: 3,),
                                CategoryChip(
                                  text: 'anime',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CategoryChip(
                              text: "action",
                            ),
                            Text(
                              "Having spent most of her life exploring the jungle,nothing could  prepare Dora for her most dangerous adventure yet — high school.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.white),
                              textAlign: TextAlign.start,
                            ),

                            Row(
                              children: [
                                Image.asset("assets/images/rating_star.png"),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "7.7",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MovieSuggesionList(
              listTitle: "More Like This",
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
