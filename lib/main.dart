import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: EmotionalDiary()));

class EmotionalDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Todays Self Reflection'),
        backgroundColor: Color.fromRGBO(35, 0, 0, 100),
      ),
      body: Column(
        children: <Widget>[
          Reflection_Value('Dankbabrkeit'),
          Reflection_Value('Produktivität'),
          Reflection_Value('Freude'),
        ],
      )
    );
  }
}

class Reflection_Value extends StatelessWidget {
  final String title;
  const Reflection_Value(this.title)
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        leading: Checkbbox(
          value: false,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18
            fontWeight: FontWeight.w600,
            color: Color.black54),
          )

        ),
      ),
    );
  }
}