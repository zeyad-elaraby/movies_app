import 'package:flutter/material.dart';
import 'package:movies_app/film_play_screen.dart';
import 'package:movies_app/items/searched_movie_item.dart';
import '../../apis/api_manager/api_manager.dart';
import '../../apis/responses/new/SearchMovies.dart';


class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
  var searchResults = [];
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF121312),
      child: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    query = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Color(0xFF9b9c9b))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Color(0xFF9b9c9b))
                    ),

                    enabled: true,
                    filled: true,
                    fillColor: Color(0xFF514F4F),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xFF939292)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              query.isEmpty
                  ? Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.27),
                child: Column(
                  children: [
                    Icon(Icons.local_movies,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.35),
                    Text(
                      'No Movies Found',
                      style: TextStyle(color: Color(0xFF9b9c9b)),
                    )
                  ],
                ),
              )
                  : FutureBuilder(
                future: ApiManager.getSearchMovies(query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    widget.searchResults = snapshot.data!.results ?? [];

                    if (widget.searchResults.isEmpty) {
                      // If no search results found, show "No Movies Found"
                      return Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.27),
                        child: Column(
                          children: [
                            Icon(Icons.local_movies,
                                color: Colors.grey,
                                size: MediaQuery.of(context).size.width * 0.35),
                            Text(
                              'No Movies Found',
                              style: TextStyle(color: Color(0xFF9b9c9b)),
                            )
                          ],
                        ),
                      );
                    }
                    print(widget.searchResults[0].id??"nothing");

                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SearchedMovieItem(
                            movie: widget.searchResults[index],
                          );
                        },
                        itemCount: widget.searchResults.length,
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                              height: 1,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.27),
                      child: Column(
                        children: [
                          Icon(Icons.local_movies,
                              color: Colors.green,
                              size: MediaQuery.of(context).size.width * 0.35),
                          Text(
                            'No Movies Found',
                            style: TextStyle(color: Color(0xFF9b9c9b)),
                          )
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}
