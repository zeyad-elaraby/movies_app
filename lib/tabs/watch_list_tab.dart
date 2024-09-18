import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/firebase_functions.dart';

import '../film_play_screen.dart';
import '../items/watch_list_item.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFunctions.getFilmWatchList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Center(child: Text("something went wrong")),
            ],
          );
        } else if (snapshot.hasData) {
          var data = snapshot.data?.docs
              .map(
                (e) => e.data(),
              )
              .toList();
          if (data?.isEmpty ?? true) {
            return Column(
              children: [
                Center(child: Text("no data found")),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Watchlist",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                arguments: data[index].id,
                                  context, FilmPlayScreen.routeName
                              );


                            },
                            child: WatchListItem(
                              image: data[index].image ,
                              booked: data[index].isBooked ,
                              title: data[index].title,
                              releaseDate: data[index].releaseDate, description: data[index].description??"",
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            Divider(
                              height: 1,
                              color: Color(0xFF707070),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      },
                      itemCount: data!.length),
                )
              ],
            );
          }
        } else {
          return Column(
            children: [
              Text("some thing went wrong"),
            ],
          );
        }
      },
    );
  }
}

// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 40,),
//         Padding(
//           padding:  EdgeInsets.only(left:10),
//           child: Text("Watchlist",style: GoogleFonts.inter(fontSize:22,fontWeight:FontWeight.w400,color: Colors.white),),
//         ),
//         Expanded(
//           child: ListView.separated(itemBuilder: (context, index) {
//            return InkWell(
//                onTap: () {
//                  Navigator.pushNamed(context, FilmPlayScreen.routeName);
//
//                },
//                child: WatchListItem());
//           }, separatorBuilder: (context, index) {
//             return Column(
//               children: [
//                 Divider(
//                   height: 1,
//                   color: Color(0xFF707070),
//                 ),
//                 SizedBox(height:5,),
//               ],
//             );
//           }, itemCount: 10),
//         )
//
//       ],
//     );
