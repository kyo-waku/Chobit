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
  bool _trash = false;
  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onPanUpdate: (DragUpdateDetails dud) {
        if (dud.delta.dy > 30) {
          setState(() {
            _trash = true;
          });
        }
        if (dud.delta.dy < -30) {
          setState(() {
            _trash = false;
          });
        }
      },
      child: Center(
        child: Column(
          children: <Widget>[
            _trash
                ? IconButton(
                    icon: Icon(
                      Icons.delete_forever,
                      size: 36.0,
                    ),
                    tooltip: 'Delete',
                    onPressed: () {
                      setState(() {
                        _trash = false;
                      });
                    },
                  )
                : SizedBox(height: 0),
            SizedBox(
              height: 600, // card height
              child: PageView.builder(
                itemCount: 10,
                controller: PageController(viewportFraction: 0.8),
                onPageChanged: (int index) => setState(() => {
                      _index = index,
                      _trash = false,
                    }),
                itemBuilder: (_, i) {
                  return (Transform.scale(
                    scale: i == _index ? 0.88 : 0.9,
                    child: CardWithIconBackground(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class CardWithIconBackground extends StatefulWidget {
  CardWithIconBackground({Key key}) : super(key: key);
  @override
  _CardWithIconBackgroundState createState() => _CardWithIconBackgroundState();
}

class _CardWithIconBackgroundState extends State<CardWithIconBackground> {
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
    Size size = MediaQuery.of(context).size;
    double scrollViewHeight = size.height * 0.7;
    return (Container(
      height: scrollViewHeight, // todo:いい感じに収まるようにするにはどうしたらええんやろう
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
            SquareCardWithIconBackground(),
          ],
        ),
      ),
    ));
  }
}

class SquareCardWithIconBackground extends StatefulWidget {
  SquareCardWithIconBackground({Key key}) : super(key: key);
  @override
  _SquareCardWithIconBackgroundState createState() =>
      _SquareCardWithIconBackgroundState();
}

class _SquareCardWithIconBackgroundState
    extends State<SquareCardWithIconBackground> {
  @override
  Widget build(BuildContext context) {
    double cardScale = 180;
    return (SizedBox(
      width: cardScale,
      height: cardScale,
      child: Card(
        color: Colors.blue[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: <Widget>[
            Center(
              child: Opacity(
                opacity: 0.5,
                child: Icon(
                  Icons.directions_run,
                  color: Colors.blueGrey,
                  size: 100.0,
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 3),
                    Text(
                      'Running',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
