import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/artists/artists.dart';
import '../../dtos/artist_dto.dart';
import 'artists_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https(
    'w9-database-96144-default-rtdb.asia-southeast1.firebasedatabase.app',
    'artists.json',
  );

  @override
  Future<List<Artists>> fetchArtists() async {
    final response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data.entries
          .map((entry) => ArtistDto.fromJson(entry.key, entry.value))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artists?> fetchArtistById(String id) async {
    return null;
  }
}
