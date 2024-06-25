import '../domain/gif.dart';

abstract class GifState {
  List<Gif> gifs;

  GifState({required this.gifs,});

}

class GifInitialState extends GifState{
  GifInitialState() : super(gifs: []);
}

class GifSuccessState extends GifState{
  GifSuccessState({required List<Gif> gifs}) : super(gifs: gifs);
}

class GifLoadingState extends GifState {
  GifLoadingState() : super(gifs: []);
}

class GifFailState extends GifState {
  GifFailState() : super(gifs: []);
}