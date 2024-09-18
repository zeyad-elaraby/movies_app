import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/apis/api_manager/api_manager.dart';
import 'package:movies_app/apis/responses/new/MoviesList.dart';
import 'package:movies_app/film_play_screen.dart';
import 'package:movies_app/items/film_item_with_rating.dart';

import 'firebase_functions.dart';
import 'models/categorie_model.dart';
import 'models/film_watch_list_model.dart';

class CategoryFilmList extends StatelessWidget {
  const CategoryFilmList({super.key});
  static const String routeName = "CategoryFilmList";
  @override
  Widget build(BuildContext context) {
    var catId = ModalRoute.of(context)?.settings.arguments as Genres;
    return FutureBuilder(
      future: ApiManager.getMovieDiscover(catId.id ?? 0),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("something went wrong");
        } else if (snapshot.hasData) {
          var data = snapshot.data?.results ?? [];
          return Scaffold(
            backgroundColor: Color(0xFF121312),
            appBar: AppBar(
              backgroundColor: Color(0xFF121312),
              title: Text(
                catId.name ?? "",
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
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
                            Navigator.pushNamed(
                                context, FilmPlayScreen.routeName,
                                arguments: data[index].id);
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 24),
                              child: FilmItemWithRating(
                                  image:
                                      'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                                  rating: data[index].voteAverage.toString(),
                                  movieName: data[index].title ?? "",
                                  publicationDate:
                                      data[index].releaseDate ?? "",
                                  addFilmWatchList: () {
                                    bookMarkFunction(
                                      id: data[index].id ?? 0,
                                      title: data[index].title ?? "",
                                      image: data[index].posterPath ?? "",
                                      releaseDate:
                                          data[index].releaseDate ?? "",
                                      isBooked: true,
                                      description: data[index].overview ?? "",
                                    );
                                  })));
                    },
                    itemCount: data.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text("no data");
        }
      },
    );
  }

  bookMarkFunction(
      {required int id,
      required String title,
      required String image,
      required String releaseDate,
      required String description,
      required bool isBooked}) {
    FilmWatchListModel model = FilmWatchListModel(
        id: id,
        title: title,
        image: image,
        releaseDate: releaseDate,
        isBooked: isBooked,
        description: description);
    FirebaseFunctions.addFilmWatchList(model);
  }
}
