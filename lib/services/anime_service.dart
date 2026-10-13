import 'dart:convert';

import 'package:esercitazione_api/models/anime.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  static const url = 'https://api.tenrai.org/v1/anime/';

  static Future<List<Anime>> fetchAnime() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as List;
      return data.map((json) => Anime.fromJson(json)).toList();
    } else {
      throw Exception('Errore nella richiesta http');
    }
  }
}
