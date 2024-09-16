import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/apis/api_manager/api_manager.dart';
import 'package:movies_app/category_film_list.dart';
import 'package:movies_app/film_play_screen.dart';

import '../../items/category_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getMoviesList(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }else if(snapshot.hasError){
          return Text("somthing went wrong");
        }
        else if(snapshot.hasData){
          var genres=snapshot.data?.genres??[];
          if(genres.isEmpty){
            return Text("no categories to browse");
          }else{
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Browse Category ",
                    style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 16 / 9),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CategoryFilmList.routeName,
                              arguments: genres[index]
                              );
                            },
                            child: CategoryItem(id: genres[index].id??0,name: genres[index].name??"",));
                      },
                      itemCount: genres.length,
                    ),
                  ),
                )
              ],
            );
          }
        }else{
          return Text("no categories to browse");
        }
      },
    );
  }
}
