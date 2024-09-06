import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../film_play_screen.dart';
import '../items/film_item.dart';
import '../items/film_item_with_rating.dart';
import '../movie_suggession_List.dart';

class HomeTab extends StatelessWidget {

  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                  height: 290,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Stack(
                        // fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image:
                            AssetImage("assets/images/stack_film_Background_home.png",),height: 217,width:  412,),
                          Center(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, FilmPlayScreen.routeName);
                                  },
                                  icon: Image(
                                      image: AssetImage("assets/images/play-button.png")))),
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
                                  Navigator.pushNamed(context, FilmPlayScreen.routeName);

                                },
                                child: FilmItem(filmImage: "assets/images/film_image.png",)),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Dora and the lost city of gold",
                                  style: TextStyle(color: Colors.white,),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "2019  PG-13  2h 7m",
                                  style: TextStyle(color: Colors.white,),
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
                                  Navigator.pushNamed(context, FilmPlayScreen.routeName);
                                },
                                child: FilmItem(
                                  filmImage: "assets/images/film_image.png",
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: 10),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child:InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, FilmPlayScreen.routeName);

                  },
                  child: MovieSuggesionList(listTitle: "Recommended",itemCount: 6,)),
            )
          ]),
    );
  }
}
