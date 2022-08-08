// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables
import "package:flutter/material.dart";
import "package:flutter_echarts/flutter_echarts.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final xAxisData = [1, 2, 3, 4, 5, 6];
  final yAxisData = [];
  final seriesData = [10, 20, 30, 40, 50, 60];

  @override
  void initState() {
    // for (int i = 0; i < 6; i++) {
    //   final newDict = { 'x': xAxisData[i], 'y': yAxisData[i]};
    //   seriesData.add(newDict);

    // }
    print(seriesData);
    super.initState();
  }

  void onPressedStart() {
    print("Start Pressed");
  }

  void onPressedStop() {
    print("Stop Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chart"),
        ),
        body: Column(
          children: [
            SizedBox(
              width: 350,
              height: 250,
              child: Echarts(
                option: '''
                     {
                      xAxis: {
                        type: 'category',
                        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                      },
                      yAxis: {
                        type: 'value'
                      },
                      series: [{
                        data: [820, 932, 901, 934, 1290, 1330, 1320],
                        type: 'line'
                      }]
                    }''',
              ),
            ),
            Column(
              children: [
                ElevatedButton(onPressed: onPressedStart, child: Text("Start")),
                ElevatedButton(onPressed: onPressedStop, child: Text("Stop")),
              ],
            ),
          ],
        ));
  }
}
