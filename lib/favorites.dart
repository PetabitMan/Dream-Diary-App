import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './dreamitem.dart';

class Favorites extends StatefulWidget {
  final List _favoriteList;
  final Function _deleteFavorite;

  Favorites(this._favoriteList, this._deleteFavorite);
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(70, 0, 0, 100),
        title: new Text('Favorite Dreams'),
      ),
      body: ListView.builder(
        itemCount: widget._favoriteList.length,
        itemBuilder: (context, i) {
          return Container(
              child: DreamItem(
                  widget._favoriteList[i].title,
                  DateFormat.yMMMd().format(widget._favoriteList[i].date),
                  widget._favoriteList[i].id,
                  widget._deleteFavorite,
  
                  ));
        },
      ),
    );
  }
}