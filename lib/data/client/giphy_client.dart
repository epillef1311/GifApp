import 'dart:convert';

import 'package:flutter_gif/data/client/base_client.dart';
import 'package:logger/logger.dart';

import '../entity/response.dart';

class GiphyClient extends BaseClient{
  final String baseUrl;
  final String apiKey;

  GiphyClient({
    required this.baseUrl,
    required this.apiKey,
    required super.log,
});

  Future<Response> getTrending({int? limit, int? offset}) async {
    final params = {
      'api_key' : apiKey,
    };

    if (limit != null) {
      params['limit'] = limit.toString();
    }

    if (offset != null){
      params['offset'] = offset.toString();
    }
    final response = await get(baseUrl,'/v1/gifs/trending', queryParameters: params);

    checkKo(response, 'get_trending', body: params.toString());

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Response.fromJson(json);
  }


  Future<Response> getReactions({int? limit, int? offset}) async {
    final params = {
      'api_key' : apiKey,
      'q': 'reactions',
    };

    if (limit != null) {
      params['limit'] = limit.toString();
    }

    if (offset != null){
      params['offset'] = offset.toString();
    }
    final response = await get(baseUrl,'/v1/gifs/search', queryParameters: params);

    checkKo(response, 'get_reactions', body: params.toString());

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Response.fromJson(json);
  }



  Future<Response> getEntertainment({int? limit, int? offset}) async {
    final params = {
      'api_key' : apiKey,
      'q': 'entertainment',
    };

    if (limit != null) {
      params['limit'] = limit.toString();
    }

    if (offset != null){
      params['offset'] = offset.toString();
    }
    final response = await get(baseUrl,'/v1/gifs/search', queryParameters: params);

    checkKo(response, 'get_reactions', body: params.toString());

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Response.fromJson(json);
  }
}