import 'package:flutter/foundation.dart';

@immutable
final class JokeModel {
  final int id;
  final String text;
  final double rating;

  const JokeModel({required this.id, required this.text, required this.rating});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    double rating = 0.0;
    if (json['rating'] is int) {
      rating = (json['rating'] as int).toDouble();
    } else if (json['rating'] is double) {
      rating = json['rating'];
    }
    return JokeModel(id: json['id'], text: json['text'], rating: rating);
  }
}
