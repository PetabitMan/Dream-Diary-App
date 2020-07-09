import 'package:flutter/material.dart';

class DreamItem extends StatefulWidget {
  final String title;
  final String date;
  final String id;
  final Function deleteDream;
  


  DreamItem(this.title, this.date, this.id, this.deleteDream,);
  
  @override
  _DreamItemState createState() => _DreamItemState();
}

class _DreamItemState extends State<DreamItem> {
  Icon heart = Icon(Icons.favorite_border);
  int count = 1;

  void addToFavorites() {
    setState(() {
      if (count == 0) {
        heart = Icon(Icons.favorite_border);
        count += 1;
      } else {
        heart = Icon(
          Icons.favorite,
          color: Colors.red,
        );
        count -= 1;
      }
      

      //append to favorites
    });
  }
  @override

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        title: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.52,
                    margin: const EdgeInsets.all(10),
                    //padding: EdgeInsets.all(10),

                    child: Text(
                      widget.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.date,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ],
          ),
          onPressed: () {}, //open dream
        ),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: heart,
                onPressed: addToFavorites, // make favorit
              ),
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () => widget.deleteDream(widget.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
