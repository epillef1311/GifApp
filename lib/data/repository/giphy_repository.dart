import 'package:flutter_gif/data/client/giphy_client.dart';
import 'package:flutter_gif/data/entity/network_mapper.dart';

import '../../domain/gif.dart';

class GiphyRepository {
  final GiphyClient client;
  final NetworkMapper mapper;

  GiphyRepository({required this.client, required this.mapper,});

  Future<List<Gif>> getTrending({int? limit, int? offset}) async {
    final response = await client.getTrending(limit: limit, offset: offset);
    return mapper.toGifs(response.data);
  }

  Future<List<Gif>> getReactions({int? limit, int? offset}) async {
    final response = await client.getReactions(limit: limit, offset: offset);
    return mapper.toGifs(response.data);
  }

  Future<List<Gif>> getEntertainment({int? limit, int? offset}) async {
    final response = await client.getEntertainment(
        limit: limit, offset: offset);
    return mapper.toGifs(response.data);
  }
}