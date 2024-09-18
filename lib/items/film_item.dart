import 'package:flutter/material.dart';

class FilmItem extends StatefulWidget {
  String filmImage;
  Function addFilmWatchList;
  FilmItem({required this.filmImage,required this.addFilmWatchList, super.key});

  @override
  State<FilmItem> createState() => _FilmItemState();
}

class _FilmItemState extends State<FilmItem> {
  bool bookMarkIcon = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              widget.filmImage,
              height: 150,
              width: 100,
              fit: BoxFit.fill,
            )),
        InkWell(
            onTap:
            () {
                  setState(() {
                    bookMarkIcon = !bookMarkIcon;
                  });
                  widget.addFilmWatchList();
            },
            child: bookMarkIcon
                ? ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          4,
                        ),
                        topLeft: Radius.circular(4)),
                    child: Image.asset("assets/images/bookedmark.png"))
                : ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          4,
                        ),
                        topLeft: Radius.circular(4)),
                    child: Image.asset(
                      "assets/images/un_booked_mark_icon.png",
                    ))),
      ],
    );
  }
}
