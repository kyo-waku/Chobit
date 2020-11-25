import 'package:flutter/material.dart';
import './input_page/singleItem.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text('title'),
          ),
          expandedHeight: 50,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return SingleItem();
            },
            childCount: 5,
          ),
        ),
      ],
    ));
  }
}
