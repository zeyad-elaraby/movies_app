import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String name;
  int id;
  String image;
  CategoryItem({required this.id,required this.image,required this.name ,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        alignment: Alignment.center, children: [
      Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:Image.asset(image,
                fit: BoxFit.cover,
              )
          )),
      Container(
        color: Colors.black.withOpacity(0.4),
      ),
      Center(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      )
    ]);
  }
}
