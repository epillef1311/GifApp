import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gif/bloc/gif_bloc.dart';
import 'package:flutter_gif/bloc/gif_events.dart';
import 'package:flutter_gif/data/repository/giphy_repository.dart';
import 'package:flutter_gif/presentation/gifs/gifs_list_model.dart';
import 'package:flutter_gif/presentation/gifs/preview_gif.dart';
import 'package:flutter_gif/util/values.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';
import '../../bloc/gif_state.dart';
import '../../domain/gif.dart';
import '../../util/design_utils.dart';
import 'package:provider/provider.dart';

class GifGrid extends StatefulWidget{
  final List<Gif> listGifts;
  const GifGrid({this.listGifts = const []});


  @override
  State<GifGrid> createState() => _GifsState();
}


class _GifsState extends State<GifGrid> with DesignUtils{
  late final GifsListModel _model;
  late final GifBloc bloc;
  final PagingController<int, Gif> _pagingController = PagingController(firstPageKey: 0);
  final _gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);
  Object? _activeCallbackIdentity;
  
  @override
  void initState(){

    super.initState();
    bloc = Provider.of<GifBloc>(context, listen: false);
    bloc.inputGif.add(LoadGifEvent());

    _model = GifsListModel(Provider.of<Logger>(context, listen: false), Provider.of<GiphyRepository>(context, listen: false),);

    _pagingController.addPageRequestListener((offset) async {
      final callbackIdentity = Object();
      _activeCallbackIdentity = callbackIdentity;

      Timer.run(() async {
        try{

          final gifs = widget.listGifts;
          if (callbackIdentity == _activeCallbackIdentity){
            _pagingController.appendPage(gifs, offset + GifsListModel.limit);
          }
        }catch (e){
          if (callbackIdentity == _activeCallbackIdentity) {
            _pagingController.error = e;
          }
        }
      });
    });
  }
  @override
  void dispose(){
    _pagingController.dispose();
    super.dispose();
    //bloc.inputGif.close();
  }

  @override
  Widget build(BuildContext context){
        return PagedGridView<int, Gif>(
          pagingController: _pagingController,
          gridDelegate: _gridDelegate,
          builderDelegate: PagedChildBuilderDelegate<Gif>(itemBuilder: (context, item, index){
            return PreviewGif(gif: item, isInLeft: index.isEven,);
          },
            firstPageProgressIndicatorBuilder: (context) => Shimmer.fromColors(
              baseColor: isLight(context) ? shimmerBaseColor: shimmerBaseColorDark,
              highlightColor: isLight(context) ?  shimmerHighlightColor : shimmerBaseColorDark,
              child: SizedBox(
                width: 1,
                height: 1,
                child: GridView.builder(gridDelegate: _gridDelegate,
                    itemCount: GifsListModel.limit,
                    itemBuilder: (Context, index) => ShimmerPreviewGIf(isInLeft: index.isEven),
                ),
              ),
            )
          )
        );
      }
  }
