class FilmWatchListModel {
  int id;
  String title;
  String image;
  String releaseDate;
  String? description;
  bool isBooked;

  FilmWatchListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.releaseDate,
    required this.description,
    this.isBooked = false,
  });

  FilmWatchListModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json["title"],
          image: json["image"],
          releaseDate: json["releaseDate"],
          description: json["description"],
          id: json["id"],
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "image": image,
      "releaseDate": releaseDate,
      "id": id,
      "description": description,
      "isBooked": isBooked,
    };
  }
}
