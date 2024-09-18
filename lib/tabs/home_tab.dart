import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/firebase_functions.dart';

import '../apis/api_manager/api_manager.dart';
import '../film_play_screen.dart';
import '../items/film_item.dart';
import '../items/film_item_with_rating.dart';
import '../models/film_watch_list_model.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        ApiManager.getPopular(),
        ApiManager.getUpcoming(),
        ApiManager.getTopRated(),
      ]),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("some thing went wrong");
        } else {
          var popular = snapshot.data?[0]?.results ?? [];
          var getUpcoming = snapshot.data?[1]?.results ?? [];
          var getTopRated = snapshot.data?[2]?.results ?? [];
          return SingleChildScrollView(
            child: Column(children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: 290,
                    viewportFraction: 1,
                    autoPlay: true,
                    enlargeCenterPage: true),
                itemCount: popular.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Stack(alignment: Alignment.bottomLeft, children: [
                    Stack(
                      // fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${popular[index].backdropPath}',
                          height: 217,
                          width: MediaQuery.of(context)
                              .size
                              .width, // constrain to screen width
                          fit: BoxFit.cover,
                        ),
                        Center(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    FilmPlayScreen.routeName,
                                    arguments: popular[index].id,
                                  );
                                },
                                icon: Image(
                                    image: AssetImage(
                                        "assets/images/play-button.png")))),
                      ],
                    ),
                    Positioned(
                      top: 140,
                      left: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, FilmPlayScreen.routeName);
                              },
                              child: FilmItem(
                                  filmImage:
                                      'https://image.tmdb.org/t/p/w200${popular[index].posterPath}',
                                  addFilmWatchList: () {
                                    bookMarkFunction(
                                        id: popular[index].id,
                                        title: popular[index].title,
                                        image: popular[index].backdropPath,
                                        releaseDate: popular[index].releaseDate,
                                        isBooked: true, description: popular[index].overview);
                                  })),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text(
                                popular[index].title ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                popular[index].releaseDate ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  color: Color(0xFF282A28),
                  height: 210,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "New Releases ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, FilmPlayScreen.routeName,
                                        arguments: getUpcoming[index].id);
                                  },
                                  child: FilmItem(
                                      filmImage:
                                          'https://image.tmdb.org/t/p/w200${getUpcoming[index].posterPath}',
                                      addFilmWatchList: () {
                                        bookMarkFunction(
                                             id: getUpcoming[index].id,
                                            title: getUpcoming[index].title,
                                            image:
                                                getUpcoming[index].backdropPath,
                                            releaseDate:
                                                getUpcoming[index].releaseDate,
                                            isBooked: true, description: getUpcoming[index].overview);
                                      }),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: getUpcoming.length),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  color: Color(0xFF282A28),
                  height: 300, // Increased height for better visibility
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Recommended", // Fixed typo
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, FilmPlayScreen.routeName,
                                      arguments: getTopRated[index].id);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: SizedBox(
                                    // width: 170, // Fixed width for each item
                                    child: FilmItemWithRating(
                                      image:
                                          'https://image.tmdb.org/t/p/w200${getTopRated[index].posterPath}',
                                      movieName:
                                          getTopRated[index].title ?? "Unknown",
                                      rating: getTopRated[index]
                                              .voteAverage
                                              .toString() ??
                                          "No rating", // Fixed the type issue here
                                      publicationDate:
                                          getTopRated[index].releaseDate ??
                                              "Unknown",
                                      addFilmWatchList: () {
                                        bookMarkFunction(
                                            id: getTopRated[index].id,
                                            title: getTopRated[index].title,
                                            image:
                                                getTopRated[index].backdropPath,
                                            releaseDate:
                                                getTopRated[index].releaseDate,
                                            isBooked: true, description: getTopRated[index].overview);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            itemCount: getTopRated.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          );
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
        isBooked: isBooked, description: description);
    FirebaseFunctions.addFilmWatchList(model);
  }
}
