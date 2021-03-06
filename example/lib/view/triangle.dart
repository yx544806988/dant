
import 'package:dant/dant.dart';
import 'package:flutter/material.dart';

import 'package:example/comm/comm.dart';

class TriangleDemo extends StatefulWidget {
  @override
  TriangleDemoState createState() => new TriangleDemoState();
}

class TriangleDemoState extends State<TriangleDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Comm.getTitleBar(title: 'TriangleDemo'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FTriangle(
              position: FTrianglePosition.top,
              color: Colors.red,
              width: 10,
              height: 20,
            ),
            SizedBox(height: 16),
            FTriangle(
              position: FTrianglePosition.right,
              color: Colors.blue,
              width: 10,
              height: 20,
            ),
            SizedBox(height: 16),
            FTriangle(
              position: FTrianglePosition.left,
              color: Colors.black,
              width: 40,
              height: 40,
            ),
            SizedBox(height: 16),
            FTriangle(
              position: FTrianglePosition.bottom,
              color: Colors.green,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
