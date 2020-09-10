import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:flutter_echarts/flutter_echarts.dart';  

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      
      //Center(
      // child: Container(
      //   color: Colors.blue,
      //   width: 500,
      //   height: 100,
      //   child: Text('Chart Widget'),
      // ),
      child: Center(
        child: Column(            
          children: [
            //1
            Text('Recent Actions'),
            
            //2 ToDo:カレンダーの表示状態を固定したい。
            HeatMapCalendar(
              input: {
                TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 3))): 5,
                TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 2))): 35,
                TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 1))): 14,
                TimeUtils.removeTime(DateTime.now()): 5,
              },
              colorThresholds: {
                1: Colors.green[100],
                10: Colors.green[300],
                30: Colors.green[500]
              },
              weekDaysLabels: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
              monthsLabels: [
                "",
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun",
                "Jul",
                "Aug",
                "Sep",
                "Oct",
                "Nov",
                "Dec",
              ],
              squareSize: 20.0,
              textOpacity: 0.3,
              labelTextColor: Colors.blueGrey,
              dayTextColor: Colors.blue[500],
            ),

            //3
            Container(
              child: Center(
                child: Echarts( //ToDo：背景色をお洒落にしたい。ContainerのColor指定だと反映されない
                option : '''
                  {
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
                          data: [1, 2, 3, 4, 3, 5, 1],
                          coordinateSystem: 'polar',
                          name: 'Running',
                          stack: 'a'
                        }, {
                          type: 'bar',
                          data: [2, 4, 4, 1, 3, 2, 1],
                          coordinateSystem: 'polar',
                          name: 'Coding',
                          stack: 'a'
                        }, {
                          type: 'bar',
                          data: [1, 2, 3, 4, 1, 2, 5],
                          coordinateSystem: 'polar',
                          name: 'Reading',
                          stack: 'a'
                        }],
                      legend: {
                          show: true,
                          data: ['Running', 'Coding', 'Reading']
                      }
                  }
                ''',
                ),
              ),
              width: 300,
              height: 350,
              
            ),


        ],//Column children
      )
    )
    ));
  }
}

