import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import './dreamitem.dart';
import './Modules/dream.dart';
import './newDreams.dart';
import './favorites.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(new DreamdiaryApp());
  }

class DreamdiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Diary',
      home: DreamList(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.cyan,
      ),
    );
  }
}

class DreamList extends StatefulWidget {
  @override
  _DreamListState createState() => _DreamListState();
}

class _DreamListState extends State<DreamList> {
  final List<Dream> _dreamList = [
    Dream('Rhino Reiten', DateTime.now(), DateTime.now().toString()),
    Dream('Rhino Reiten', DateTime.now(), DateTime.now().toString()),
    Dream('Rhino Reiten', DateTime.now(), DateTime.now().toString()),
    Dream('Rhino Reiten', DateTime.now(), DateTime.now().toString()),

  ];

  final List<Dream> _favoriteList = [];
  
  void _deleteDream(String id) {
    setState(() {
      _dreamList.removeWhere((dr) {
      return dr.id == id;
    });
    });
    
  }

  void _addDream(String title, DateTime selectedDate) {
    final newDr = Dream(
      title,
      selectedDate,
      DateTime.now().toString(),
    );
    Navigator.of(context).pop();
    setState(() {
      _dreamList.add(newDr);
    });
  }
  void _deleteFavorite(String id) {
    setState(() {
      _favoriteList.removeWhere((dr) {
      return dr.id == id;
    });
    });
    
  }



  void popUpWindow(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: NewDream(_addDream),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void goToFavorites(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return Favorites(_favoriteList, _deleteFavorite);
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Dream Diary'), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          tooltip: 'Your favorite dreams',
          onPressed: () => goToFavorites(context),
        ),
        IconButton(
          icon: Icon(Icons.add),
          tooltip: 'Add a dream',
          onPressed: () => popUpWindow(context),
        ),
      ]),
      body: ListView.builder(
        itemCount: _dreamList.length,
        itemBuilder: (context, i) {
          return Container(
              child: DreamItem(
                  _dreamList[i].title,
                  DateFormat.yMMMd().format(_dreamList[i].date),
                  _dreamList[i].id,
                  _deleteDream,
                  ));
        },
      ),
      floatingActionButton: Platform.isIOS ? Container(): FloatingActionButton(
        onPressed: () =>
            popUpWindow(context), //adding dreams ,poping up textfield
        child: Icon(Icons.add),
      ),
    );
  }
}

// clicking on section and opening Textfield
// adding drawing field
// Ability to delete entries
//pop up Dialog

// sending Push Up Notifications

// adding Ressources Button with text

//ability to add favorite dreams
