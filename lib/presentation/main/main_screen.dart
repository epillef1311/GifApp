import 'package:flutter/material.dart';
import 'package:flutter_gif/bloc/gif_bloc.dart';
import 'package:flutter_gif/bloc/gif_events.dart';
import 'package:flutter_gif/bloc/gif_state.dart';
import 'package:flutter_gif/presentation/gifs/gifs_grid.dart';
import 'package:flutter_gif/presentation/gifs/gifs_list.dart';
import 'package:flutter_gif/util/design_utils.dart';
import 'package:flutter_gif/presentation/navigation/navigation_drawer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget with DesignUtils{
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<GifBloc>(context);
    //bloc.inputGif.add(GridViewEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIFs'),
      ),
      body: StreamBuilder<GifState>(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if(snapshot.data is GifLoadingState){
            return const CircularProgressIndicator();
          }
          if (snapshot.data is GifSuccessState){
            if(bloc.isSwitched == false){
              return GifsList(listGifts: snapshot.data!.gifs,);
            }else {
              return GifGrid(listGifts: snapshot.data!.gifs,);
            }

          }

          return const GifsList();
        }
      ),
      drawer: NavigationDraw(),
    );
  }
}