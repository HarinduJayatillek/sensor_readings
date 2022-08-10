// ignore_for_file: implementation_imports, sized_box_for_whitespace, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import './scan.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  // final xAxisData = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  // final yAxisData = [820, 932, 901, 934, 1290, 1330, 1320];
  // final seriesData = [];

  @override
  void initState() {
    // for (int i = 0; i < xAxisData.length; i++) {
    //   final newDict = {'x': xAxisData[i], 'y': yAxisData[i]};
    //   seriesData.add(newDict);
    // }
    // print(seriesData);
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
        title: const Text('Chart'),
      ),
      body: Container(
        width: 350,
        height: 250,
        child: Echarts(
          option: '''
                  {
                    xAxis: {
                      type: 'category', 
                      data:   [1, 2, 3, 4, 5, 6, 7] 
                    },
                    yAxis: {
                      type: 'value',
                    },
                    series: [{
                      data: [820, 932, 901, 934, 1290, 1330, 1320],
                      type: 'line'
                    }]
                  }
                ''',
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: onPressedStart, child: Text("Start")),
          ElevatedButton(onPressed: onPressedStop, child: Text("Stop")),
          ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ScanDevice())),
              child: Text("Scan Devices")),
        ],
      ),
    );
  }
}
