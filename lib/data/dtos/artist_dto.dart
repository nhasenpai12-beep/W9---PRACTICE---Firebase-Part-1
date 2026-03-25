import '../../model/artists/artists.dart';

class ArtistDto {
  static const String nameKey = 'name';
  static const String genreKey = 'genre';
  static const String imageUrlKey = 'imageUrl';

  static Artists fromJson(String id, Map<String, dynamic> json) {
    return Artists(
      id: id,
      name: json[nameKey] as String,
      genre: json[genreKey] as String,
      imageUrl: json[imageUrlKey] as String,
    );
  }

  static Map<String, dynamic> toJson(Artists artists) {
    return {
      nameKey: artists.name,
      genreKey: artists.genre,
      imageUrlKey: artists.imageUrl,
    };
  }
}