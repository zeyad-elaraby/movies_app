import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/category_film_list.dart';

import 'apis/api_manager/api_manager.dart';
import 'firebase_functions.dart';
import 'items/category_chip.dart';
import 'items/film_item.dart';
import 'items/film_item_with_rating.dart';
import 'models/film_watch_list_model.dart';

class FilmPlayScreen extends StatefulWidget {
  static const String routeName = "FilmPlayScreen";
  const FilmPlayScreen({super.key});

  @override
  State<FilmPlayScreen> createState() => _FilmPlayScreenState();
}

class _FilmPlayScreenState extends State<FilmPlayScreen> {
  @override
  Widget build(BuildContext context) {
    num movieId = ModalRoute.of(context)?.settings.arguments as num;
    print("this is in film $movieId");
    return FutureBuilder(
      future: ApiManager.getDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("error");
        }
        var data = snapshot.data!;
        return Scaffold(
          backgroundColor: Color(0xFF1D1E1D),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              data.title ?? "",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF1D1E1D),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${data.backdropPath}',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Image(
                                image: AssetImage(
                                    "assets/images/play-button.png")))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data.releaseDate ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FilmItem(
                            filmImage:
                                'https://image.tmdb.org/t/p/w500${data.posterPath}',
                            addFilmWatchList: () {
                              bookMarkFunction(
                                  id: data.id ?? 0,
                                  title: data.title ?? "",
                                  image: data.backdropPath ?? "",
                                  releaseDate: data.releaseDate ?? "",
                                  isBooked: true, description: data.overview??"");
                            },
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 3,
                                  runSpacing: 5,
                                  children: List.generate(
                                      data.genres?.length ?? 0, (index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          CategoryFilmList.routeName,
                                          arguments: data.genres?[index],
                                        );
                                      },
                                      child: CategoryChip(
                                        text: data.genres?[index].name ?? "",
                                      ),
                                    );
                                  }),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    data.overview ?? "",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/rating_star.png"),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      (data.voteAverage
                                          .toString()
                                          .substring(0, 3)),
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
                FutureBuilder(
                  future: ApiManager.getSimilar(movieId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("error");
                    }
                    var similarData = snapshot.data?.results ?? [];
                    print(
                        "Similar movies data: ${snapshot.data?.results ?? []}");

                    return Padding(
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
                                "More Like This", // Fixed typo
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, FilmPlayScreen.routeName,
                                            arguments: similarData[index].id);
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: FilmItemWithRating(
                                          image:
                                              'https://image.tmdb.org/t/p/w200${similarData[index].posterPath}',
                                          movieName:
                                              similarData[index].title ??
                                                  "Unknown",
                                          rating: similarData[index]
                                                  .voteAverage
                                                  .toString() ??
                                              "No rating",
                                          publicationDate:
                                              similarData[index]
                                                      .releaseDate ??
                                                  "Unknown",
                                          addFilmWatchList:
                                          (){
                                            bookMarkFunction(
                                                id: similarData[index].id??0,
                                                title: similarData[index].title??"",
                                                image: similarData[index].backdropPath??"",
                                                releaseDate: similarData[index].releaseDate??"",
                                                isBooked: true, description: similarData[index].overview??"");
                                          }
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 10);
                                  },
                                  itemCount: similarData.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
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
        isBooked: isBooked, description:description );
    FirebaseFunctions.addFilmWatchList(model);
  }
}
