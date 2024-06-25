import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/bloc/gif_events.dart';
import 'package:provider/provider.dart';

import '../../bloc/gif_bloc.dart';

class NavigationDraw extends StatefulWidget{
  bool isSwitched = false;

  NavigationDraw({Key? key});

  @override
  State<NavigationDraw> createState() => _NavigationDrawState();
}

class _NavigationDrawState extends State<NavigationDraw> {


  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<GifBloc>(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Switch(value: widget.isSwitched, onChanged: (value) {
                if (bloc.isSwitched == false) {
                  setState(() {
                    widget.isSwitched = true;
                    bloc.inputGif.add(SwitchEvent());
                  }

                  );
                }
                else {
                  setState(() {
                    widget.isSwitched = false;
                    bloc.inputGif.add(SwitchEvent());
                  });
                }
              }),
              TextButton(
                onPressed: () {
                  bloc.inputGif.add(TrendingViewEvent());
                },
                child: const Text("Trending"),
              ),
              TextButton(onPressed: () {
                  bloc.inputGif.add(ReactionViewEvent());
              },
                  child: const Text("Reactions")),
              TextButton(onPressed: () {
                  bloc.inputGif.add(EntertainmentViewEvent());
              },
                child: const Text("Entertainment"),)
            ],
          ),
        ),
      ),
    );
  }
}