import 'package:flutter_gif/data/entity/rendition.dart';

class Images{
  final Rendition original;
  final Rendition previewGif;

  Images({
    required this.original,
    required this.previewGif,
});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      original: Rendition.fromJson(json['original'] as Map<String, dynamic>),
      previewGif: Rendition.fromJson(json['preview_gif'] as Map<String, dynamic>),
    );
  }
}