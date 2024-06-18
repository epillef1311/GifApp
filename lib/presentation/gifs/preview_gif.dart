import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/presentation/detail/detail_screen.dart';

import '../../domain/gif.dart';

class PreviewGif extends StatelessWidget{
  static const margin = 4.0;
  static const borderRadius = 4.0;

  final Gif gif;
  final bool isInLeft;

  const PreviewGif({required this.gif, required this.isInLeft,});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        right: isInLeft ? 0.0 : margin,
      ),
      child:  GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(gif: gif),
          )
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(gif.previewUrl),
          ),
        ),
      ),
    );
  }
}

class ShimmerPreviewGIf extends StatelessWidget {
  final bool isInLeft;

  const ShimmerPreviewGIf({required this.isInLeft});

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.only(
          left: PreviewGif.margin,
          top: PreviewGif.margin,
          right: isInLeft ? 0.0 : PreviewGif.margin,
        ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(PreviewGif.margin)),
        child: Container(
          color: Colors.white,
          child: const Text(''),
        ),
      ),
      );
  }
}