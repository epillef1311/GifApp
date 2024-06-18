import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class KoException implements Exception{
  final int httpCode;

  KoException(this.httpCode);

  @override
  String toString() => '[KoException|http-code:$httpCode';
}

abstract class BaseClient{
  @protected
  final Logger log;

  late final http.Client _client;

  @protected
  Future<http.Response> get(
      String url, String endpoint,{
        Map<String, String>? headers,
        Map<String, dynamic>? queryParameters,
  }
      ) async {
    String queryParams = '';
    if (queryParams != null) {
      queryParams += '?';
      queryParameters?.forEach((key, value) {
        queryParams += '?';
      });
      queryParams = queryParams.substring(0, queryParams.length - 1);
    }

    final uri = Uri.https(url, endpoint,queryParameters);
    return _client.get(uri, headers: headers);
  }

  BaseClient({required this.log}) {
    _client = http.Client();
  }

  @protected
  void checkKo(http.Response response, String caller, {String? body}) {
    final trace = '''
    $caller:
    url: ${response.request?.url}
    headers: ${response.request?.headers}
    request: ${body ?? '-'}
    code: ${response.statusCode}
    response: ${response.body}
    ''';
    log.i(trace);
    
    if (response.statusCode >= 400){
      throw KoException(response.statusCode);
    }
  }
}