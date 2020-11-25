import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Icon(Icons.directions_run_outlined, size: 60),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'Habit Title',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.headline5.fontSize,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.grade_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.thumb_up_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.copyright_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.king_bed_outlined),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
