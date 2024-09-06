import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../film_play_screen.dart';
import '../items/watch_list_item.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40,),
        Padding(
          padding:  EdgeInsets.only(left:10),
          child: Text("Watchlist",style: GoogleFonts.inter(fontSize:22,fontWeight:FontWeight.w400,color: Colors.white),),
        ),
        Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
           return InkWell(
               onTap: () {
                 Navigator.pushNamed(context, FilmPlayScreen.routeName);

               },
               child: WatchListItem());
          }, separatorBuilder: (context, index) {
            return Column(
              children: [
                Divider(
                  height: 1,
                  color: Color(0xFF707070),
                ),
                SizedBox(height:5,),
              ],
            );
          }, itemCount: 10),
        )

      ],
    );
  }
}