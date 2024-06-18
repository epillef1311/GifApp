import 'package:flutter_gif/data/repository/giphy_repository.dart';
import 'package:logger/logger.dart';

import '../../domain/gif.dart';

class GifsListModel {
  static const limit = 50;

  final Logger _log;
  final GiphyRepository _giphyRepo;

  const GifsListModel(this._log, this._giphyRepo);

  Future<List<Gif>> fetchGifs(int offset) async {
    try{
      return await _giphyRepo.getTrending(
        offset: offset,
        limit: limit,
      );
    } catch(e){
      _log.e('Error while obtaining trending gifs: $e');
      rethrow;
    }
  }
}