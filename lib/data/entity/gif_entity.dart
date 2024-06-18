import 'package:flutter_gif/data/entity/user.dart';

import 'images.dart';

class GifEntity{
  final String id;
  final String url;
  final String title;
  final Images images;
  final User? user;

  GifEntity({
    required this.id,
    required this.url,
    required this.title,
    required this.images,
    this.user,
});

  factory GifEntity.fromJson(Map<String, dynamic> json){
    return GifEntity(
      id: json['id'] as String,
      url: json['url'] as String,
      title: json['title'] as String,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
      user: json.containsKey('user')?User.fromJson(json['user'] as Map<String, dynamic>) : null,
    );
  }
}