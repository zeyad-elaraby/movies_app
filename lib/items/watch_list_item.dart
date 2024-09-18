import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../film_play_screen.dart';

class WatchListItem extends StatefulWidget {
  String image;
  String title;
  String releaseDate;
  String description;
  bool booked ;
   WatchListItem({required this.image,required this.description,required this.booked,required this.releaseDate,required this.title,super.key});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w200${widget.image}',
                        width: 140,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                             widget. booked = !widget.booked;
                            });
                          },
                          child:widget. booked
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
                     widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      widget.releaseDate,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                      GoogleFonts.inter(color: Color(0xFFb2b2b2), fontSize: 15),
                    ),
                    Text(widget.description,
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
        SizedBox(height: 13,),

      ],
    );

  }
}
