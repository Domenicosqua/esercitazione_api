import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.title,
    required this.img,
    required this.score,
    required this.synopsis,
  });

  final String title;
  final String img;
  final double score;
  final String synopsis;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(img),
          SizedBox(width: size.height * 0.02),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(width: size.height * 0.02),
          Text('score: $score'),
          Text(synopsis),
        ],
      ),
    );
  }
}
