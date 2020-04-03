import 'package:fant/fant.dart';
import 'package:flutter/material.dart';

class MarqueeDemo extends StatefulWidget {
  @override
  MarqueeDemoState createState() => new MarqueeDemoState();
}

class MarqueeDemoState extends State<MarqueeDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('marqueedemo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
              color: Colors.blue,
              alignment: Alignment.center,
              child: FMarquee(
                text: 'ListView即滚动列表控件，能将子控件组成可滚动的列表。当你需要排列的子控件超出容器大小',
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: FNotice(
                text: 'ListView即滚动列表控件，能将子控件组成可滚动的列表。当你需要排列的子控件超出容器大小',
                leading: Icon(Icons.timer),
                trailing: Icon(Icons.clear),
              ),
            ),
          ],
        ),
      ),
    );
  }
}