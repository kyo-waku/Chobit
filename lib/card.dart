import 'package:flutter/material.dart';
import 'inheriteds.dart';
import 'define.dart';

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
              icon: _cardViewMode == 0 ? Icon(Icons.view_module) : Icon(Icons.style),
              onPressed: _onCardViewModeTapped,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '${dateTimeFormatter(new DateTime.now())}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
    Size size = MediaQuery.of(context).size;
    double scrollViewHeight = size.height * 0.7;
    var numOfHabit = MyInherited.of(context, listen: true).numOfHabit;
    return (Center(
      child: SizedBox(
        height: scrollViewHeight, // card height
        child: PageView.builder(
          itemCount: numOfHabit + 1, // +1 is for adding page
          controller: PageController(viewportFraction: 0.8),
          onPageChanged: (int index) => setState(() => {
                _index = index,
              }),
          itemBuilder: (_, i) {
            return (Transform.scale(
              scale: i == _index ? 0.9 : 0.9,
              child: (i == numOfHabit) ? AddHabitRect() : CardHistoryMode(index: i),
            ));
          },
        ),
      ),
    ));
  }
}

class AddHabitRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Card(
      color: Colors.blueGrey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: IconButton(
          icon: Icon(Icons.add_circle_outline),
          iconSize: 100,
          color: Colors.blueGrey,
          onPressed: () {
            Navigator.of(context).push(_createNewHabitRoute(context));
          },
        ),
      ),
    ));
  }
}

class AddHabitSqure extends StatelessWidget {
  final double cardScale = 180;
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: cardScale,
      height: cardScale,
      child: Card(
        color: Colors.blueGrey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.add_circle_outline),
            iconSize: 60,
            color: Colors.blueGrey,
            onPressed: () {
              Navigator.of(context).push(_createNewHabitRoute(context));
            },
          ),
        ),
      ),
    ));
  }
}

Route _createNewHabitRoute(BuildContext context) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => NewHabitPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class NewHabitPage extends StatefulWidget {
  NewHabitPage({Key key}) : super(key: key);
  @override
  _NewHabitPageState createState() => _NewHabitPageState();
}

class _NewHabitPageState extends State<NewHabitPage> {
  Color selectedContainerColor = Colors.blueGrey[200];
  void changeColor(Color color) {
    setState(() {
      selectedContainerColor = color;
    });
  }

  IconData selectedIconData = Icons.help_outline;
  void changeIcon(IconData icon) {
    setState(() {
      selectedIconData = icon;
    });
  }

  TextEditingController habitNameController = TextEditingController();
  final List<HabitIcon> habitIcons = getAvailableHabitIcons();
  @override
  Widget build(BuildContext context) {
    var addNewHabit = MyInherited.of(context, listen: true).addNewHabit;
    return (Scaffold(
      body: Container(
        color: selectedContainerColor,
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Spacer(flex: 2),
                  Opacity(
                    opacity: 0.5,
                    child: Icon(
                      selectedIconData,
                      color: Colors.blueGrey,
                      size: 80.0,
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  controller: habitNameController,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: 'Habit name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your new habit name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Spacer(flex: 1),
            Container(
              height: 100,
              child: IconSelector(changeIcon: changeIcon),
            ),
            Spacer(flex: 1),
            Container(
              height: 100,
              child: ColorSelector(changeColor: changeColor),
            ),
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    addNewHabit(new Habit(habitNameController.text, selectedContainerColor, selectedIconData, null));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Spacer(flex: 1)
          ],
        ),
      ),
    ));
  }
}

class IconSelector extends StatefulWidget {
  final Function changeIcon;
  IconSelector({Key key, this.changeIcon}) : super(key: key);
  @override
  _IconSelectorState createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  int selectedIconId = 0;
  final List<HabitIcon> habitIcons = getAvailableHabitIcons();
  @override
  Widget build(BuildContext context) {
    return (ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        for (var hi in habitIcons)
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: IconButton(
              icon: Icon(hi.icon, size: 80, color: ((hi.id == selectedIconId) ? Colors.black : hi.iconColor)),
              iconSize: 80,
              onPressed: () => setState(() {
                selectedIconId = hi.id;
                widget.changeIcon(hi.icon);
              }),
            ),
          ),
      ],
    ));
  }
}

class ColorSelector extends StatefulWidget {
  final Function changeColor;
  ColorSelector({Key key, this.changeColor}) : super(key: key);
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int selectedColorId = 0;
  final List<HabitColor> habitColors = getAvailableHabitColors();
  @override
  Widget build(BuildContext context) {
    return (ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        for (var hc in habitColors)
          Padding(
            padding: EdgeInsets.all(16.0),
            child: IconButton(
                icon: Icon(
                  (hc.id == selectedColorId) ? Icons.check_circle_outline : Icons.lens,
                  size: 50,
                  color: hc.buttonColor,
                ),
                onPressed: () => setState(() {
                      selectedColorId = hc.id;
                      widget.changeColor(hc.color);
                    })),
          ),
      ],
    ));
  }
}

class CardHistoryMode extends StatefulWidget {
  CardHistoryMode({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _CardHistoryModeState createState() => _CardHistoryModeState();
}

class _CardHistoryModeState extends State<CardHistoryMode> {
  final int maxRecents = 3;
  @override
  Widget build(BuildContext context) {
    var tempHabit = MyInherited.of(context, listen: true).habits[widget.index];
    return (GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(context, widget.index));
      },
      child: Card(
        color: tempHabit.color, //Colors.blue[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Spacer(flex: 1),
            Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 0.5,
                child: Icon(
                  tempHabit.icon, //Icons.directions_run,
                  color: Colors.blueGrey,
                  size: 200.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '${tempHabit.title}',
                      style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Last ' + maxRecents.toString() + ' Successes',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  for (var i = 0; i < tempHabit.histories.length && i < maxRecents; i++)
                    Text(
                      '${DateTime.now().difference(tempHabit.histories[tempHabit.histories.length - i - 1].dateTime).inDays}' +
                          'days ago' +
                          ': ' +
                          '${tempHabit.histories[tempHabit.histories.length - i - 1].score.toString().split('.')[1]}',
                      style: TextStyle(fontSize: 14),
                    )
                ],
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    ));
  }
}

Route _createRoute(BuildContext context, int index) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FullPageCard(index: index),
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
  FullPageCard({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _FullPageCardState createState() => _FullPageCardState();
}

class _FullPageCardState extends State<FullPageCard> {
  // Score result = Score.Nan;
  Widget build(BuildContext context) {
    Habit tempHabit = MyInherited.of(context, listen: true).habits[widget.index];
    Score result = tempHabit.histories.firstWhere((x) => isSameDate(x.dateTime, DateTime.now()), orElse: () => History(DateTime.now(), Score.Nan)).score;

    return Scaffold(
      body:
          // ページビューは一旦停止中
          // PageView.builder(
          // itemCount: 10,
          // controller: PageController(viewportFraction: 1),
          // itemBuilder: (_, i) {
          //  return (Container(
          Container(
        color: tempHabit.color,
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
                      tempHabit.icon,
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
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '${tempHabit.title}',
                        style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                      ),
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
                                    result = Score.Excellent,
                                    MyInherited.of(context, listen: true).newRecord(tempHabit.title, result),
                                  }),
                              color: result == Score.Excellent ? Colors.black : Colors.blueGrey,
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
                                    result = Score.Nice,
                                    MyInherited.of(context, listen: true).newRecord(tempHabit.title, result),
                                  }),
                              color: result == Score.Nice ? Colors.black : Colors.blueGrey,
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
                                    result = Score.Chobit,
                                    MyInherited.of(context, listen: true).newRecord(tempHabit.title, result),
                                  }),
                              color: result == Score.Chobit ? Colors.black : Colors.blueGrey,
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
                                    result = Score.Break,
                                    MyInherited.of(context, listen: true).newRecord(tempHabit.title, result),
                                  }),
                              color: result == Score.Break ? Colors.black : Colors.blueGrey,
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
    var numOfHabit = MyInherited.of(context, listen: true).numOfHabit;
    Size size = MediaQuery.of(context).size;
    double scrollViewHeight = size.height * 0.7;
    return (Container(
      height: scrollViewHeight, // todo:いい感じに収まるようにするにはどうしたらええんやろう
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (var i = 0; i < numOfHabit + 1; i++) (i == numOfHabit) ? AddHabitSqure() : SquareCard(index: i),
          ],
        ),
      ),
    ));
  }
}

class SquareCard extends StatefulWidget {
  SquareCard({Key key, this.index}) : super(key: key);
  final int index;
  @override
  _SquareCard createState() => _SquareCard();
}

class _SquareCard extends State<SquareCard> {
  @override
  Widget build(BuildContext context) {
    var tempHabit = MyInherited.of(context, listen: true).habits[widget.index];
    double cardScale = 180;
    return (GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(context, widget.index));
      },
      child: SizedBox(
        width: cardScale,
        height: cardScale,
        child: Card(
          color: tempHabit.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: <Widget>[
              Center(
                child: Opacity(
                  opacity: 0.5,
                  child: Icon(
                    tempHabit.icon,
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
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '${tempHabit.title}',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
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
