import 'package:chobit/view/habit_input_view.dart';
import 'package:flutter/material.dart';
import './habit_detail_view.dart';
import './habit_input_view.dart';

class SingleItemBarGraph extends StatelessWidget {
  final MaterialColor accentColor;
  final String title;
  final int score;
  final List<int> dates;
  final List<int> scores;
  const SingleItemBarGraph({this.accentColor, this.title, this.score, this.dates, this.scores});

  // size
  final double singleItemHeight = 60;
  final double titleHeight = 50;
  final double scorePanelWidth = 100;

  Widget getTitle(String title, BuildContext context) {
    return Container(
      height: titleHeight,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(offset: Offset(1, 1), color: Theme.of(context).shadowColor.withOpacity(0.1), blurRadius: 2),
                BoxShadow(offset: Offset(-1, -1), color: Theme.of(context).shadowColor.withOpacity(0.1), blurRadius: 2),
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.edit),
              iconSize: 24,
              padding: EdgeInsets.all(2),
              color: accentColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return HabitInputView();
                  },
                ));
              },
            ),
          ),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  Widget getScorePanel(int score) {
    return Container(
      width: scorePanelWidth,
      height: singleItemHeight,
      child: Container(
        alignment: Alignment.topCenter,
        height: singleItemHeight / 2,
        child: Text(score.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: accentColor)),
      ),
    );
  }

  Widget getBarGraphContainer(double width, List<int> dates, List<int> results) {
    return Container(
      width: width,
      height: singleItemHeight,
      child: HistoryBarGraph(
        width: width,
        height: singleItemHeight,
        accentColor: accentColor,
        dates: dates,
        results: results,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double sideMarginWidth = 32;
    final mainContainerWidth = mediaWidth - scorePanelWidth - sideMarginWidth * 2;
    return Padding(
      padding: EdgeInsets.only(left: sideMarginWidth, right: sideMarginWidth, top: 16, bottom: 16),
      child: Column(
        children: [
          getTitle(title, context),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return HabitDetailView();
                },
              ));
            },
            child: Row(
              children: [
                getScorePanel(score),
                getBarGraphContainer(mainContainerWidth, dates, scores),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryBarGraph extends StatelessWidget {
  final double width;
  final double height;
  final MaterialColor accentColor;
  final List<int> dates;
  final List<int> results;
  const HistoryBarGraph({this.width, this.height, this.accentColor, this.dates, this.results});
  @override
  Widget build(BuildContext context) {
    final double h = (height - 20) / 3;
    return Column(
      children: [
        // Bar graphs
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var index = 0; index < results.length; index++)
              Container(
                height: h * results[index],
                width: width / 7,
                color: (index == 6) ? Colors.red.withOpacity(0.5) : accentColor.withOpacity(0.5),
              ),
          ],
        ),
        // labels
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var date in dates)
              Container(alignment: Alignment.center, height: 20, width: width / 7, child: Text(date.toString())),
          ],
        ),
      ],
    );
  }
}
