import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/util/design_utils.dart';
import 'package:flutter_gif/util/values.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/gif.dart';

class DetailScreen extends StatelessWidget{
  final Gif gif;

  const DetailScreen({required this.gif});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIF'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: marginLat,
              top: 30.0,
              right: marginLat,
              bottom: 30.0,
            ),
            child: Text(gif.title,
            style: const TextStyle(fontSize: 18.0,
                fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          _Gif(gif: gif,)
        ],
      ),
    );
  }
}

class _Gif extends StatelessWidget with DesignUtils {
  static const _size = 300.0;

  final Gif gif;

  const _Gif({required this.gif});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(
        left: marginLat,
        top: marginVert,
        right: marginLat,
        bottom: marginVert,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(stdBorderRadius)),
        child: Image.network(gif.url,
        loadingBuilder: (context, widget, loadingProcess){
          if(loadingProcess == null){
            return widget;
          }else {
            return Shimmer.fromColors(
              baseColor: isLight(context) ? shimmerBaseColor : shimmerBaseColorDark,
              highlightColor: isLight(context) ? shimmerHighlightColor : shimmerHighlightColorDark,
              child: SizedBox(
                width: _size,
                height: _size,
                child: Container(
                  color: Colors.white,
                ),
              ),
            );
          }
        },),
      ),
    );
  }
}