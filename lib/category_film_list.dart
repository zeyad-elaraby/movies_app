import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/film_play_screen.dart';
import 'package:movies_app/items/film_item_with_rating.dart';

class CategoryFilmList extends StatelessWidget {
  const CategoryFilmList({super.key});
  static const String routeName = "CategoryFilmList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF121312),
      appBar: AppBar(
        backgroundColor: Color(0xFF121312),

        title: Text(
          "Action",
          style: GoogleFonts.inter(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, FilmPlayScreen.routeName);
                    },
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                        child: FilmItemWithRating(
                          image: "assets/images/film_image.png",
                          rating: '9',
                          movieName: 'peaky blinders',
                          publicationDate: "22/4/20013",
                        )));
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
