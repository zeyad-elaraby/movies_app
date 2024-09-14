// import 'package:flutter/material.dart';
//
// import 'items/film_item_with_rating.dart';
//
// class MovieSuggesionList extends StatelessWidget {
//   final String listTitle;
//   final int itemCount;
//   final String image;
//   final int index;
//   final String movieName;
//   final String rating;
//   final String publicationDate;
//
//   MovieSuggesionList({
//     required this.listTitle,
//     required this.rating,
//     required this.publicationDate,
//     required this.movieName,
//     required this.index,
//     required this.image,
//     required this.itemCount,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFF282A28),
//       height: 280,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: Text(
//               listTitle,
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(vertical: 4),
//                     child: FilmItemWithRating(
//                       image: image,
//                       movieName: movieName,
//                       rating: rating,
//                       publicationDate: publicationDate,
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return SizedBox(width: 10);
//                 },
//                 itemCount: itemCount,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
