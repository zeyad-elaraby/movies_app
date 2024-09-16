import 'dart:convert';

import 'package:http/http.dart' as http;

import '../responses/new/DetailsResponse.dart';
import '../responses/new/MovieDiscover.dart';
import '../responses/new/MoviesList.dart';
import '../responses/new/PopularResponse.dart';
import '../responses/new/SearchMovies.dart';
import '../responses/new/SimilarResponse.dart';
import '../responses/new/TopRatedResponse.dart';
import '../responses/new/UpcomingReponse.dart';

class ApiManager{

 static Future<PopularResponse> getPopular ()
  async{
    Uri url=Uri.https("api.themoviedb.org","3/movie/popular",
        {
          "language":"en-US",
          "page":"1",
        });

    http.Response response = await http.get(url,headers:  { "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
      "accept": "application/json"},);
    Map<String,dynamic> jsonFormat= jsonDecode(response.body);
    PopularResponse popularResponse=PopularResponse.fromJson(jsonFormat);
    return popularResponse;
  }

 static Future<UpcomingReponse> getUpcoming ()
  async{
    Uri url=Uri.https("api.themoviedb.org","3/movie/upcoming",
        {
          "language":"en-US",
        });

    http.Response response = await http.get(url,headers:  { "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
      "accept": "application/json"},);
    Map<String,dynamic> jsonFormat= jsonDecode(response.body);
    UpcomingReponse upcomingResponse=UpcomingReponse.fromJson(jsonFormat);
    return upcomingResponse;
  }

 static Future<TopRatedResponse> getTopRated ()
  async{
    Uri url=Uri.https("api.themoviedb.org","3/movie/top_rated",
        {
          "language":"en-US",
        });

    http.Response response = await http.get(url,headers:  { "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
      "accept": "application/json"},);
    Map<String,dynamic> jsonFormat= jsonDecode(response.body);
    TopRatedResponse topRatedResponse=TopRatedResponse.fromJson(jsonFormat);
    return topRatedResponse;
  }

 static Future<DetailsResponse?> getDetails(num movie_id) async {
   print("this is movie $movie_id");
   Uri url = Uri.https(
     "api.themoviedb.org",
     "3/movie/$movie_id", // Fixed movie_id string interpolation
     {
       "language": "en-US",
     },
   );

   try {
     http.Response response = await http.get(
       url,
       headers: {
         "Authorization":
         "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
         "accept": "application/json",
       },
     );

     if (response.statusCode == 200) {
       Map<String, dynamic> jsonFormat = jsonDecode(response.body);
       DetailsResponse detailsResponse = DetailsResponse.fromJson(jsonFormat);
       return detailsResponse;
     } else {
       print('Error: ${response.statusCode} - ${response.reasonPhrase}');
     }
   } catch (e) {
     print('Exception occurred: ${e.toString()}');
   }
 }
   static Future<SimilarResponse> getSimilar (num movie_id)
  async{
    Uri url=Uri.https("api.themoviedb.org","3/movie/$movie_id/similar",
        {
          "language":"en-US",
        });

    http.Response response = await http.get(url,headers:  { "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
      "accept": "application/json"},);
    Map<String,dynamic> jsonFormat= jsonDecode(response.body);
    SimilarResponse similarResponse=SimilarResponse.fromJson(jsonFormat);
    return similarResponse;
  }

 static Future<MoviesList> getMoviesList ()
  async{
    Uri url=Uri.https("api.themoviedb.org","3/genre/movie/list",
        {
          "language":"en-US",
        });

    http.Response response = await http.get(url,headers:  { "Authorization":
    "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
      "accept": "application/json"},);
    Map<String,dynamic> jsonFormat= jsonDecode(response.body);
    MoviesList moviesList=MoviesList.fromJson(jsonFormat);
    return moviesList;
  }

 static Future<SearchMovies?> getSearchMovies (String query)
  async{
    Uri url=Uri.https("api.themoviedb.org","3/search/movie",
        {
          "language":"en-US","query": query,
        });
    try{
      http.Response response = await http.get(url,headers:  { "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
        "accept": "application/json"},);
      if(response.statusCode==200){
        Map<String,dynamic> jsonFormat= jsonDecode(response.body);
        SearchMovies searchMovies=SearchMovies.fromJson(jsonFormat);
        return searchMovies;
      }else{
        print("Error:${response.statusCode}");
        return null;
      }

    }catch(e){
print("exception: ${e.toString()}");
return null;


    }
  }

 static  Future<MovieDiscover?> getMovieDiscover (num id)
  async{
    Uri url=Uri.https("api.themoviedb.org","3/discover/movie",
        {
          "language":"en-US","with_genres": id.toString(),
        });

    try
    {
      http.Response response = await http.get(url,headers:  { "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
        "accept": "application/json"},);
      Map<String,dynamic> jsonFormat= jsonDecode(response.body);
      MovieDiscover movieDiscover=MovieDiscover.fromJson(jsonFormat);
      print(movieDiscover);
      return movieDiscover;
    }
    catch(e)
    {
      print(e.toString());
    }
    return null;

  }


}