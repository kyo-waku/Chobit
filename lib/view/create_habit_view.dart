import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../model/habit_defs.dart';

class CreateHabitView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final emojiController = useTextEditingController();
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
            TextFormField(
              controller: titleController,
              autovalidateMode: AutovalidateMode.always,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.bookmark),
                hintText: '習慣のタイトル',
              ),
            ),
            SizedBox(height: 50),
            Text('Emoji', style: TextStyle(fontSize: 20)),
            TextFormField(
              controller: emojiController,
              autovalidateMode: AutovalidateMode.always,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.bookmark),
                hintText: '絵文字',
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', style: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    onPressed: () {
                      final Habit testHabit = new Habit('dummy', titleController.text, emojiController.text, false);
                      Navigator.pop(context, testHabit);
                    },
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
