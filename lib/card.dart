import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int _cardViewMode = 0; // 0 : Swipable, 1: Arranged
  void _onCardViewModeTapped() {
    setState(() {
      if (_cardViewMode == 0) {
        _cardViewMode = 1;
      } else {
        _cardViewMode = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: _cardViewMode == 0
                  ? Icon(Icons.view_module)
                  : Icon(Icons.style),
              onPressed: _onCardViewModeTapped,
            ),
          ),
          _cardViewMode == 0 ? SwipableCardWidget() : ArrangedCardWidget()
        ],
      ),
    ));
  }
}

class SwipableCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 300,
      height: 600,
      color: Colors.yellow,
      child: Text('Swipable Card UI'),
    ));
  }
}

class ArrangedCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        Container(width: 180, height: 180, color: Colors.purple),
        Container(width: 180, height: 180, color: Colors.purple),
        Container(width: 180, height: 180, color: Colors.purple),
        Container(width: 180, height: 180, color: Colors.purple),
        Container(width: 180, height: 180, color: Colors.purple),
        Container(width: 180, height: 180, color: Colors.purple),
      ],
    ));
  }
}
