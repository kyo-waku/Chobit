import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int _cardViewMode = 0; // 0 : Swipable, 1: Arranged
  Widget _currentCardView = SwipableCardWidget();
  void _onCardViewModeTapped() {
    setState(() {
      if (_cardViewMode == 0) {
        _cardViewMode = 1;
        _currentCardView = ArrangedCardWidget();
      } else {
        _cardViewMode = 0;
        _currentCardView = SwipableCardWidget();
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _currentCardView,
          ),
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

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: () {},
      child: Center(
        child: SizedBox(
          height: 600, // card height
          child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (int index) => setState(() => {
                  _index = index,
                }),
            itemBuilder: (_, i) {
              return (Transform.scale(
                scale: i == _index ? 0.9 : 0.9,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: CardHistoryMode(),
                  back: CardRecordMode(),
                ),
              ));
            },
          ),
        ),
      ),
    ));
  }
}

class CardRecordMode extends StatefulWidget {
  CardRecordMode({Key key}) : super(key: key);
  @override
  _CardRecordModeState createState() => _CardRecordModeState();
}

class _CardRecordModeState extends State<CardRecordMode> {
  @override
  Widget build(BuildContext context) {
    return (Card(
      color: Colors.green[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: 0.5,
              child: Icon(
                Icons.directions_run,
                color: Colors.blueGrey,
                size: 200.0,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(flex: 2),
                  Text(
                    'Running',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.brightness_low,
                            size: 50,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            'Excellent',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.thumb_up,
                            size: 50,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            'Nice',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.copyright,
                            size: 50,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            'Chobit',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.local_cafe,
                            size: 50,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            'Break',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class CardHistoryMode extends StatefulWidget {
  CardHistoryMode({Key key}) : super(key: key);
  @override
  _CardHistoryModeState createState() => _CardHistoryModeState();
}

class _CardHistoryModeState extends State<CardHistoryMode> {
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
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
            SquareCard(),
          ],
        ),
      ),
    ));
  }
}

class SquareCard extends StatefulWidget {
  SquareCard({Key key}) : super(key: key);
  @override
  _SquareCard createState() => _SquareCard();
}

class _SquareCard extends State<SquareCard> {
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
