// ignore_for_file: avoid_print

import 'package:biokit/biokit.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    DNA dna = DNA(seq: 'ATCGGC');
    print(dna.freq());
    // See: https://biokit.org/docs/usage
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('BioKit'),
      ),
    );
  }
}