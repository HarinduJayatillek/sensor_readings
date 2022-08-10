// ignore_for_file: prefer_const_literals_to_create_immutables, argument_type_not_assignable_to_error_handler, unused_field, avoid_print, prefer_const_constructors, unused_import

import 'package:location_permissions/location_permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class ScanDevice extends StatefulWidget {
  const ScanDevice({super.key});

  @override
  State<ScanDevice> createState() => _ScanDeviceState();
}

class _ScanDeviceState extends State<ScanDevice> {
  final flutterReactiveBle = FlutterReactiveBle();
  late DiscoveredDevice device;

  List<DiscoveredDevice> deviceList = [];

  void onPressedScan() {
    flutterReactiveBle
        .scanForDevices(withServices: [], scanMode: ScanMode.lowLatency).listen(
      (device) {
        setState(() {
          if (device.name.isNotEmpty) {
            // print(device.name);
            if ((deviceList.where((discoveredDevice) =>
                discoveredDevice.id.contains(device.id))).isEmpty) {
              // print(device.id);
              deviceList.add(device);
            }
          }
        });
      },
    );
  }

  void connectDevice() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanning Page')),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView(
          children: deviceList
              .map((device) => ListTile(
                    trailing: ElevatedButton(
                      onPressed: connectDevice,
                      child: Text("Connect"),
                    ),
                    title: Text(device.name),
                  ))
              .toList(),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: onPressedScan,
            backgroundColor: Color.fromARGB(255, 40, 76, 238),
            child: Icon(Icons.repeat),
          )
        ],
      ),
    );
  }
}
