import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../film_play_screen.dart';

class WatchListItem extends StatefulWidget {
   WatchListItem({super.key});
  bool bookMarkIcon = false;

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
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
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/searched_movie_image.png",
                              height: 89,
                              width: 140,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                   widget. bookMarkIcon = !widget.bookMarkIcon;
                                  });
                                },
                                child:widget. bookMarkIcon
                                    ? ClipRRect(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(4,),topLeft: Radius.circular(4)),

                                    child: Image.asset("assets/images/bookedmark.png"))
                                    : ClipRRect(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(4,),topLeft: Radius.circular(4)),

                                    child: Image.asset("assets/images/un_booked_mark_icon.png",))),

                          ],
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alita Battle Angel",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "2019",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                            GoogleFonts.inter(color: Color(0xFFb2b2b2), fontSize: 15),
                          ),
                          Text("Rosa Salazar, Christoph Waltz",
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
          SizedBox(height: 13,),
          Divider(
            height: 1,
            color: Color(0xFF707070),
          ),
        ],
      ),
    );

  }
}
