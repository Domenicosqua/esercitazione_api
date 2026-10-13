import 'package:esercitazione_api/models/anime.dart';
import 'package:esercitazione_api/services/anime_service.dart';
import 'package:esercitazione_api/views/details_page.dart';
import 'package:flutter/material.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Anime>>(
        future: AnimeService.fetchAnime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final animeList = snapshot.data!;
            return ListView.builder(
              itemCount: animeList.length,
              itemBuilder: (context, index) {
                final anime = animeList[index];
                return InkWell(
                  onTap: () {
                    final currentAnime = animeList[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          title: currentAnime.title,
                          img: currentAnime.image,
                          score: currentAnime.score,
                          synopsis: currentAnime.synopsis,
                        ),
                      ),
                    );
                  },
                  child: Card.filled(
                    child: ListTile(
                      leading: Image.network(anime.image),
                      title: Text(anime.title),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
