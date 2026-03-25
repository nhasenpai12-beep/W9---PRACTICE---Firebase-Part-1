import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'w9-database-96144-default-rtdb.asia-southeast1.firebasedatabase.app',
    'songs.json',
  );

  @override
  Future<List<Song>> fetchSongs() async {
    final response = await http.get(songsUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data.entries
          .map((entry) => SongDto.fromJson(entry.key, entry.value as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return null;
  }
}
