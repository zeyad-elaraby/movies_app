import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/film_play_screen.dart';

class SearchedMovieItem extends StatelessWidget {
  SearchedMovieItem({required this.movie, super.key});
  late var movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 89,
              width: 333,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FilmPlayScreen.routeName);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 89,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ""}',
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title??"",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            movie.releaseDate??"",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.inter(
                                color: Color(0xFFb2b2b2), fontSize: 15),
                          ),
                          Text(movie.originalLanguage??"",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.inter(
                                  color: Color(0xFFb2b2b2), fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Divider(
            height: 1,
            color: Color(0xFF707070),
          ),
        ],
      ),
    );
  }
}
