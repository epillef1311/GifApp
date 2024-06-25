import 'dart:async';

import 'package:flutter_gif/presentation/gifs/gifs_grid.dart';
import 'package:flutter_gif/presentation/gifs/gifs_list.dart';

import '../data/repository/giphy_repository.dart';
import '../domain/gif.dart';
import 'gif_events.dart';
import 'gif_state.dart';

class GifBloc{

  final GiphyRepository giphyRepo;

  final StreamController<GifEvent> _inputGifController = StreamController<GifEvent>();
  final StreamController<GifState> _outputGifController = StreamController<GifState>();

  Sink<GifEvent> get inputGif => _inputGifController.sink;
  Stream<GifState> get stream => _outputGifController.stream;

  GifBloc({required this.giphyRepo}){
    _inputGifController.stream.listen(_mapEventToState);
  }

  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  List<Gif> gifs = [];


  void toggleSwitch() {
    _isSwitched = !_isSwitched;
  }

  _mapEventToState(GifEvent event) async{
    if (event is LoadGifEvent){
    gifs = await giphyRepo.getTrending(limit: 50, offset: 0);
    }
    else if (event is GridViewEvent){
      return GifGrid();
    }
    else if(event is ListViewEvent){
      return GifsList();
    }
    else if(event is ReactionViewEvent){
      gifs = await giphyRepo.getReactions(limit: 50, offset: 0);
    }
    else if(event is EntertainmentViewEvent){
      gifs = await giphyRepo.getEntertainment(limit: 50, offset: 0);
    }
    else if(event is TrendingViewEvent){
      gifs = await giphyRepo.getTrending(limit: 50, offset: 0);

    }
    else if(event is SwitchEvent){
      toggleSwitch();
    }
    _outputGifController.add(GifSuccessState(gifs: gifs));
  }
}