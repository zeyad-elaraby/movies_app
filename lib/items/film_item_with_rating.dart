import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'film_item.dart';

class FilmItemWithRating extends StatelessWidget {
  String rating;
  String image;
  String movieName;
  String publicationDate;
  FilmItemWithRating(
      {required this.rating,
      required this.movieName,
      required this.image,
      required this.publicationDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFF343534),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(1, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilmItem(
            filmImage: image,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, bottom: 10, right: 30, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/rating_star.png"),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      rating,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    )
                  ],
                ),
                Text(movieName,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10)),
                Text(publicationDate  ,
                    style: GoogleFonts.inder(
                        color: Color(0xFFB5B4B4),
                        fontWeight: FontWeight.w400,
                        fontSize: 8)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
