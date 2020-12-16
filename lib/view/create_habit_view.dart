import 'package:flutter/material.dart';

class CreateHabitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('New Habit'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
        child: Column(
          children: <Widget>[
            Text('Title', style: TextStyle(fontSize: 20)),
            TextField(),
            SizedBox(height: 50),
            Text('Emoji', style: TextStyle(fontSize: 20)),
            TextField(),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text('Cancel', style: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text('Ok', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
