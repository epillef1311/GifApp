import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/data/client/giphy_client.dart';
import 'package:flutter_gif/data/repository/giphy_repository.dart';
import 'package:flutter_gif/keys.dart';
import 'package:flutter_gif/presentation/app/app.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'bloc/gif_bloc.dart';
import 'data/entity/network_mapper.dart';
import '';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final providers = createProviders();
  runApp(App(providers : providers));
}

List<SingleChildWidget> createProviders() {

  final log = Logger(printer: PrettyPrinter());
  final networkMapper = NetworkMapper();
  final giphyRepo = GiphyRepository(client: GiphyClient(
    baseUrl: 'api.giphy.com',
    apiKey: giphyApiKey,
    log: log,
  ), mapper: networkMapper,);
  final GifBloc giphyBloc = GifBloc(giphyRepo: giphyRepo);
  return [
    Provider<Logger>.value(value: log),
    Provider<GiphyRepository>.value(value: giphyRepo),
    Provider<GifBloc>.value(value: giphyBloc,)
  ];
}