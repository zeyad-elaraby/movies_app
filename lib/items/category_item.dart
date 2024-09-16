import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String name;
  int id;
  CategoryItem({required this.id,required this.name ,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        alignment: Alignment.center, children: [
      Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:Image.asset("assets/images/browse_tab_image.png",
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
