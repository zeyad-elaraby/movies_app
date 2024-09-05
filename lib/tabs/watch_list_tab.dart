import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
           return WatchListItem();
          }, separatorBuilder: (context, index) {
            return SizedBox(height:5,);
          }, itemCount: 10),
        )

      ],
    );
  }
}