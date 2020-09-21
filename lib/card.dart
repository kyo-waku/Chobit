import 'package:flutter/material.dart';
import './inheriteds.dart';

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
              '${MyInherited.of(context, listen: true).today}',
              textAlign: TextAlign.center,
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.5, fontWeightDelta: 2),
            ),
          ),
          _currentCardView,
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
          onPageChanged: (int index) => setState(() => {
                _index = index,
              }),
          itemBuilder: (_, i) {
            return (Transform.scale(
              scale: i == _index ? 0.9 : 0.9,
              child: CardHistoryMode(),
            ));
          },
        ),
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
    return (GestureDetector(
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        child: Card(
          color: Colors.blue[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                        style: TextStyle(
                            fontSize: 42, fontWeight: FontWeight.bold),
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
        )));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FullPageCard(),
    // transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //   return child;
    // },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

class FullPageCard extends StatefulWidget {
  FullPageCard({Key key}) : super(key: key);
  @override
  _FullPageCardState createState() => _FullPageCardState();
}

class _FullPageCardState extends State<FullPageCard> {
  int result = 4; // 1: Excellent, 2: Nice, 3: Chobit, 4: Break
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // ページビューは一旦停止中
          // PageView.builder(
          // itemCount: 10,
          // controller: PageController(viewportFraction: 1),
          // itemBuilder: (_, i) {
          //  return (Container(
          Container(
        color: Colors.blue[200],
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  bottomRight: const Radius.elliptical(210, 90),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: Icon(
                      Icons.directions_run,
                      color: Colors.blueGrey,
                      size: 120.0,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Running',
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.brightness_low),
                              iconSize: 50,
                              onPressed: () => setState(() => {
                                    result = 1,
                                  }),
                              color:
                                  result == 1 ? Colors.black : Colors.blueGrey,
                            ),
                            Text(
                              'Excellent',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.thumb_up),
                              iconSize: 50,
                              onPressed: () => setState(() => {
                                    result = 2,
                                  }),
                              color:
                                  result == 2 ? Colors.black : Colors.blueGrey,
                            ),
                            Text(
                              'Nice',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.copyright),
                              iconSize: 50,
                              onPressed: () => setState(() => {
                                    result = 3,
                                  }),
                              color:
                                  result == 3 ? Colors.black : Colors.blueGrey,
                            ),
                            Text(
                              'Chobit',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.local_cafe),
                              iconSize: 50,
                              onPressed: () => setState(() => {
                                    result = 4,
                                  }),
                              color:
                                  result == 4 ? Colors.black : Colors.blueGrey,
                            ),
                            Text(
                              'Break',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(flex: 2),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Spacer(flex: 1)
          ],
        ),
      ),
    );
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
    return (GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute());
      },
      child: SizedBox(
        width: cardScale,
        height: cardScale,
        child: Card(
          color: Colors.blue[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
