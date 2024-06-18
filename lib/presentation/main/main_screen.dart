import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/presentation/gifs/gifsList.dart';
import 'package:flutter_gif/util/design_utils.dart';

class MainScreen extends StatelessWidget with DesignUtils{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIFs'),
      ),
      body: const Gifslist(),
    );
  }
}