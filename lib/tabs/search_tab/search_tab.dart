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
      color: Colors.black,
      child: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    query = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
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
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              )
                  : FutureBuilder<SearchMovies>(
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
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                          ],
                        ),
                      );
                    }
                    print(widget.searchResults[0].id??"nothing");

                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(widget.searchResults[index].id);
                              Navigator.pushNamed(
                                context,
                                FilmPlayScreen.routeName,
                                arguments:  widget.searchResults[index].id,

                              );
                            },
                            child: SearchedMovieItem(
                              movie: widget.searchResults[index],
                            ),
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
                            style: Theme.of(context).textTheme.titleLarge,
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
