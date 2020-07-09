import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewDream extends StatefulWidget {
  final Function addDr;

  NewDream(this.addDr);
  @override
  _NewDreamState createState() => _NewDreamState();
}

class _NewDreamState extends State<NewDream> {
  
  final titleController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void _submitDream() {
    final titleText = titleController.text;
    if (titleText.isEmpty) {
      return;
    }
    widget.addDr(titleText, selectedDate);
  }

  void chooseDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
      child: Column(
          children: [
            Container(
              child: Card(
                child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text('I hope you had a nice Dream')),
              ),
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(labelText: '  Title'),
                onSubmitted: (_) => _submitDream(),
                controller: titleController,
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: selectedDate == null
                      ? Text(DateFormat.yMd().format(DateTime.now()).toString())
                      : Text(DateFormat.yMd().format(selectedDate).toString()),
                ),
              ),
              FlatButton(
                onPressed: chooseDate,
                child: Text(
                  'Choose date',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ])
          ],
        
      ),
    );
  }
}
