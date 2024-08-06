class Movie{

  String movie_id;
  String movie_name;
  String movie_image_name;
  int movie_year;
  String category_name;
  String director_name;

  Movie({required this.movie_id, required this.movie_name, required this.movie_image_name,
  required this.movie_year, required this.category_name, required this.director_name});

  factory Movie.fromJson(String key, Map<dynamic, dynamic> json){
    return Movie(
        movie_id: key,
        movie_name: json["film_ad"],
        movie_image_name: json["film_resim"],
        movie_year: json["film_yil"],
        category_name: json["kategori_ad"],
        director_name: json["yonetmen_ad"]
    );
  }
}