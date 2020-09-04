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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '31th August 2020',
              textAlign: TextAlign.center,
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.5, fontWeightDelta: 2),
            ),
          ),
          _cardViewMode == 0 ? SwipableCardWidget() : ArrangedCardWidget()
        ],
      ),
    ));
  }
}

class SwipableCardWidget extends StatefulWidget {
  SwipableCardWidget({Key key}) : super(key: key);
  @override
  _SwipableCardState createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipableCardWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return (Center(
      child: SizedBox(
        height: 600, // card height
        child: PageView.builder(
          itemCount: 10,
          controller: PageController(viewportFraction: 0.8),
          onPageChanged: (int index) => setState(() => _index = index),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 0.88 : 0.9,
              child: HalfRoundedImageCard(),
            );
          },
        ),
      ),
    ));
  }
}

class HalfRoundedImageCard extends StatefulWidget {
  HalfRoundedImageCard({Key key}) : super(key: key);
  @override
  _HalfRoundedImageCardState createState() => _HalfRoundedImageCardState();
}

class _HalfRoundedImageCardState extends State<HalfRoundedImageCard> {
  @override
  Widget build(BuildContext context) {
    return (Card(
      color: Colors.blue[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: Icon(
              Icons.directions_run,
              color: Colors.blueGrey,
              size: 360.0,
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 150),
                  Text(
                    'Running',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text('Last 3 Successes'),
                  SizedBox(height: 30),
                  Text('7days ago'),
                  Text('4days ago'),
                  Text('2days ago'),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class ArrangedCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 650, // todo:いい感じに収まるようにするにはどうしたらええんやろう
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            Container(width: 180, height: 180, color: Colors.yellow),
            Container(width: 180, height: 180, color: Colors.yellow),
            Container(width: 180, height: 180, color: Colors.green),
            Container(width: 180, height: 180, color: Colors.green),
            Container(width: 180, height: 180, color: Colors.yellow),
            Container(width: 180, height: 180, color: Colors.yellow),
            Container(width: 180, height: 180, color: Colors.green),
            Container(width: 180, height: 180, color: Colors.green),
            Container(width: 180, height: 180, color: Colors.yellow),
            Container(width: 180, height: 180, color: Colors.yellow),
            Container(width: 180, height: 180, color: Colors.green),
            Container(width: 180, height: 180, color: Colors.green),
          ],
        ),
      ),
    ));
  }
}
