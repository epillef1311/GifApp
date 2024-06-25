import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/bloc/gif_bloc.dart';
import 'package:flutter_gif/bloc/gif_events.dart';
import 'package:flutter_gif/bloc/gif_state.dart';
import 'package:flutter_gif/presentation/gifs/preview_gif.dart';
import 'package:flutter_gif/util/design_utils.dart';
import 'package:provider/provider.dart';

import '../../domain/gif.dart';

class GifsList extends StatefulWidget{
  final List<Gif> listGifts;
  const GifsList({this.listGifts = const []});

  @override
  State<GifsList> createState() => _GifsListState();
}

class _GifsListState extends State<GifsList> with DesignUtils{

  late final GifBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<GifBloc>(context, listen: false);
    bloc.inputGif.add(LoadGifEvent());
  }

  @override
  void dispose(){
    super.dispose();
    //bloc.inputGif.close();
  }

  @override
  Widget build(BuildContext context) {
        return ListView.builder(
          shrinkWrap: true,
            itemCount: widget.listGifts.length,
            itemBuilder: (context, index) {
              return SizedBox(
               height: double.parse(widget.listGifts[index].height!),
                  width: 24,
              child: PreviewGif(gif: widget.listGifts[index], isInLeft: index.isEven));
            },
          );

  }

}
