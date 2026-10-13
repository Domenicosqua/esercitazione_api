class Anime {
  String title;
  String image;
  double score;
  String synopsis;

  Anime({
    required this.title,
    required this.image,
    required this.score,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['title'],
      image: json['images']['jpg']['image_url'],
      synopsis: json['synopsis'],
      score: (json['score'] as num).toDouble(),
    );
  }
}
