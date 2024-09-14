// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:movies_app/apis/responses/NewReleasesResponse.dart';
// import 'package:movies_app/apis/responses/PopularResponse.dart';
// import 'package:movies_app/apis/responses/ReommendedResponse.dart';
//
// class ApiManager {
//   // https://api.themoviedb.org/3/movie/popular
//  static Future<PopularResponse>getPopular()async{
//
//     Uri url =Uri.https( 'api.themoviedb.org','/3/movie/popular');
//
//     http.Response response = await http.get(
//       url,
//       headers: {
//         'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzQwOThmMjk3ZDQxMWFmNDI2MjRiNTllMjdkZTQxYSIsIm5iZiI6MTcyNjExOTU3NS4zNjE3OTgsInN1YiI6IjY2ZDg4NzhjMzM3NmE1MDNiNmI4YjgzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HF6uArg5N1LLGtfkCkbCIVkP51IWzXBd9gjgb7Ooz2o",
//       },
//     );
//     Map<String,dynamic> data = jsonDecode(response.body);
//     PopularResponse popularResponse=PopularResponse.fromJson(data);
//     return popularResponse;
//
//  }
//  static Future<NewReleasesResponse> getNewReleases()async{
//    //https://api.themoviedb.org/3/movie/upcoming
//    Uri url =Uri.https("api.themoviedb.org","/3/movie/upcoming");
//   http.Response response =await http.get(
//      url,
//      headers: {
//        'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzQwOThmMjk3ZDQxMWFmNDI2MjRiNTllMjdkZTQxYSIsIm5iZiI6MTcyNjExOTU3NS4zNjE3OTgsInN1YiI6IjY2ZDg4NzhjMzM3NmE1MDNiNmI4YjgzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HF6uArg5N1LLGtfkCkbCIVkP51IWzXBd9gjgb7Ooz2o",
//      }
//    );
//   Map<String,dynamic>data=jsonDecode(response.body);
//    NewReleasesResponse newReleasesResponse=NewReleasesResponse.fromJson(data);
//    return newReleasesResponse;
//  }
//  static Future<RecommendedResponse> getNewRecommended()async{
//    //https://api.themoviedb.org/3/movie/top_rated
//    Uri url =Uri.https("api.themoviedb.org","/3/movie/top_rated");
//   http.Response response =await http.get(
//      url,
//      headers: {
//        'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NzQwOThmMjk3ZDQxMWFmNDI2MjRiNTllMjdkZTQxYSIsIm5iZiI6MTcyNjExOTU3NS4zNjE3OTgsInN1YiI6IjY2ZDg4NzhjMzM3NmE1MDNiNmI4YjgzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HF6uArg5N1LLGtfkCkbCIVkP51IWzXBd9gjgb7Ooz2o",
//      }
//    );
//   Map<String,dynamic>data=jsonDecode(response.body);
//    RecommendedResponse recommendedResponse=RecommendedResponse.fromJson(data);
//    return recommendedResponse;
//  }
//
//
// }