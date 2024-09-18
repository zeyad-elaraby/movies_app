import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/film_watch_list_model.dart';

class FirebaseFunctions {
  static CollectionReference<FilmWatchListModel> getFilmsCollection() {
    return FirebaseFirestore.instance
        .collection("bookedMovies")
        .withConverter<FilmWatchListModel>(
      fromFirestore: (snapshot, _) {
        return FilmWatchListModel.fromJson(snapshot.data()!);
      },
      toFirestore: (FilmWatchListModel, _) {
        return FilmWatchListModel.toJson();
      },
    );
  }

  static void addFilmWatchList(FilmWatchListModel model) {
    var collection = getFilmsCollection().doc().set(model);
  }

  static Future<QuerySnapshot<FilmWatchListModel>> getFilmWatchList() {
    var collection = getFilmsCollection();
    return collection.get();
  }

  static Future<void> deleteFilmWatchList(int id) {
    return getFilmsCollection().doc().delete();
  }
}
