import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class ChartWidget extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<ChartWidget> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
        child: Center(
            child: Column(
      children: [
        //Switching the data display
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 35),
          child: Container(
            color: Color(0xFF404a59),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                //ToDo:切替の仕組みを作る。
                ToggleButtons(
                  borderColor: Colors.black,
                  fillColor: Color(0xFF32C5E9),
                  borderWidth: 2,
                  selectedBorderColor: Colors.black,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '4 months',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Year',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        if (i == index) {
                          isSelected[i] = true;
                        } else {
                          isSelected[i] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ],
            ),
          ),
        ),

        //A year Data
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 250),
          child: Container(
            child: Echarts(
              extraScript: '''
              var data = getVirtulData(2020);

              function getVirtulData(year) {
                year = year || '2020';
                var date = +echarts.number.parseDate(year + '-01-01');
                var end = +echarts.number.parseDate((+year + 1) + '-01-01');
                var dayTime = 3600 * 24 * 1000;
                var data = [];
                for (var time = date; time < end; time += dayTime) {
                    data.push([
                        echarts.format.formatTime('yyyy-MM-dd', time),
                        Math.floor(Math.random() * 10000)
                    ]);
                }
                return data;
              }
              ''',
              option: '''//ToDo：期間ごとの動的な表示
                    {
                      backgroundColor: '#404a59',
                      title: {
                          top: 0,
                          left: 'center',
                          textStyle: {
                              color: '#fff'
                          }
                      },
                      tooltip: {
                          trigger: 'item'
                      },
                      legend: {
                          top: '0',
                          left: '100',
                          data: ['ActivityScore', 'Top 12'],
                          textStyle: {
                              color: '#fff'
                          }
                      },
                      calendar: [{
                          top: 50,
                          left: 'center',
                          range: ['2020-01-01', '2020-04-30'],
                          splitLine: {
                              show: true,
                              lineStyle: {
                                  color: '#000',
                                  width: 2,
                                  type: 'solid'
                              }
                          },
                          yearLabel: {
                              formatter: '{start}  1st',
                              textStyle: {
                                  color: '#fff'
                              }
                          },
                          itemStyle: {
                              color: '#323c48',
                              borderWidth: 1,
                              borderColor: '#111'
                          }
                      }, {
                          top: 340,
                          left: 'center',
                          range: ['2020-07-01', '2020-12-31'],
                          splitLine: {
                              show: true,
                              lineStyle: {
                                  color: '#000',
                                  width: 2,
                                  type: 'solid'
                              }
                          },
                          yearLabel: {
                              formatter: '{start}  2nd',
                              textStyle: {
                                  color: '#fff'
                              }
                          },
                          itemStyle: {
                              color: '#323c48',
                              borderWidth: 1,
                              borderColor: '#111'
                          }
                      }],
                      series: [
                          {
                              name: 'ActivityScore',
                              type: 'scatter',
                              coordinateSystem: 'calendar',
                              data: data,
                              symbolSize: function (val) {
                                  return val[1] / 500;
                              },
                              itemStyle: {
                                  color: '#ddb926'
                              }
                          },
                          {
                              name: 'ActivityScore',
                              type: 'scatter',
                              coordinateSystem: 'calendar',
                              calendarIndex: 1,
                              data: data,
                              symbolSize: function (val) {
                                  return val[1] / 500;
                              },
                              itemStyle: {
                                  color: '#ddb926'
                              }
                          },
                          {
                              name: 'Top 12',
                              type: 'effectScatter',
                              coordinateSystem: 'calendar',
                              calendarIndex: 1,
                              data: data.sort(function (a, b) {
                                  return b[1] - a[1];
                              }).slice(0, 12),
                              symbolSize: function (val) {
                                  return val[1] / 500;
                              },
                              showEffectOn: 'render',
                              rippleEffect: {
                                  brushType: 'stroke'
                              },
                              hoverAnimation: true,
                              itemStyle: {
                                  color: '#f4e925',
                                  shadowBlur: 10,
                                  shadowColor: '#333'
                              },
                              zlevel: 1
                          },
                          {
                              name: 'Top 12',
                              type: 'effectScatter',
                              coordinateSystem: 'calendar',
                              data: data.sort(function (a, b) {
                                  return b[1] - a[1];
                              }).slice(0, 12),
                              symbolSize: function (val) {
                                  return val[1] / 500;
                              },
                              showEffectOn: 'render',
                              rippleEffect: {
                                  brushType: 'stroke'
                              },
                              hoverAnimation: true,
                              itemStyle: {
                                  color: '#f4e925',
                                  shadowBlur: 10,
                                  shadowColor: '#333'
                              },
                              zlevel: 1
                          }
                      ]
                  }
                  ''',
            ),
          ),
        ),

        //Week Data
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 300),
          child: Container(
            child: Echarts(
              option: '''
                    {
                      backgroundColor: '#404a59',
                      textStyle: {
                              color: '#fff'
                      },
                      angleAxis: {
                          type: 'category',
                          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Stu', 'Sun']
                      },
                      radiusAxis: {
                      },
                      polar: {
                      },
                      series: [{
                          type: 'bar',
                          color: '#37A2DA', 
                          data: [1, 2, 3, 4, 3, 5, 1],
                          coordinateSystem: 'polar',
                          name: 'Running',
                          stack: 'a'
                        }, {
                          type: 'bar',
                          color: '#32C5E9',
                          data: [2, 4, 4, 1, 3, 2, 1],
                          coordinateSystem: 'polar',
                          name: 'Coding',
                          stack: 'a'
                        }, {
                          type: 'bar',
                          color: '#67E0E3',
                          data: [1, 2, 3, 4, 1, 2, 5],
                          coordinateSystem: 'polar',
                          name: 'Reading',
                          stack: 'a'
                        }],
                      legend: {
                          show: true,
                          data: ['Running', 'Coding', 'Reading'],
                          textStyle: {
                              color: '#fff'
                          }
                      }
                    }
                  ''',
            ),
          ),
        ),
      ], //Column children
    ))));
  }
}
