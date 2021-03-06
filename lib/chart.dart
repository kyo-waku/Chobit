import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class ChartWidget extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<ChartWidget> {
  String dropdownValue = '4months';
  double _weekly_echart_height = 300;
  double _monthly_echart_height = 180;

  @override
  Widget build(BuildContext context) {
    return (SafeArea(
        child: Center(
            child: Column(
      children: [
        //Switching the data display
        // DropdownList
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              // toDo：登録値の読み込み処理の追加
              if (dropdownValue == '4months') {
                _weekly_echart_height = 300;
                _monthly_echart_height = 180;
              }
              if (dropdownValue == '8months') {
                _weekly_echart_height = 1;
                _monthly_echart_height = 330;
              }
              if (dropdownValue == 'A year') {
                _weekly_echart_height = 1;
                _monthly_echart_height = 480;
              }
            });
          },
          items: <String>['4months', '8months', 'A year']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),

        // A year Data
        AnimatedContainer(
          height: _monthly_echart_height,
          duration: Duration(milliseconds: 500),
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
            option: '''
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
                          cellSize: 18,
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
                          top: 200,
                          left: 'center',
                          range: ['2020-05-01', '2020-8-31'],
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
                          cellSize: 18,
                          itemStyle: {
                              color: '#323c48',
                              borderWidth: 1,
                              borderColor: '#111'
                          }
                      }, {
                          top: 350,
                          left: 'center',
                          range: ['2020-09-01', '2020-12-31'],
                          splitLine: {
                              show: true,
                              lineStyle: {
                                  color: '#000',
                                  width: 2,
                                  type: 'solid'
                              }
                          },
                          yearLabel: {
                              formatter: '{start}  3nd',
                              textStyle: {
                                  color: '#fff'
                              }
                          },
                          cellSize: 18,
                          itemStyle: {
                              color: '#323c48',
                              borderWidth: 1,
                              borderColor: '#111'
                          }
                      },{
                          top: 610,
                          left: 'center',
                          range: ['2019-01-01', '2019-04-30'],
                          splitLine: {
                              show: true,
                              lineStyle: {
                                  color: '#000',
                                  width: 2,
                                  type: 'solid'
                              }
                          },
                          yearLabel: {
                              formatter: '{start}  4th',
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
                              name: 'ActivityScore',
                              type: 'scatter',
                              coordinateSystem: 'calendar',
                              calendarIndex: 2,
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

        //Week Data
        AnimatedContainer(
          height: _weekly_echart_height,
          duration: Duration(milliseconds: 500),
          color: Colors.black,
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
      ], //Column children
    ))));
  }
}
