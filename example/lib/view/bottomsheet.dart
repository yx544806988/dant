import 'package:dant/button/index.dart';
import 'package:dant/dant.dart';
import 'package:flutter/material.dart';

import 'package:example/comm/comm.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  BottomSheetDemoState createState() => BottomSheetDemoState();
}

class BottomSheetDemoState extends State<BottomSheetDemo> {
  List<String> list = ['java', 'C#', 'PHP', 'ios', 'C++', 'Object', 'android', 'swift', 'vb', 'sql', 'python'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Comm.getTitleBar(title: 'BottomSheetDemo'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FButton(
              child: '菜单选择',
              onPressed: () {
                FBottomSheet.fBottomSheetOption(
                  context,
                  option: list,
                  initData: 'java',
                  roundTop: true,
                  onSelect: (index, value) {
                    FToast.showToast(context, msg: 'index=$index value=$value');
                  },
                ).then((data) {
                  print('test data=$data');
                  FToast.showToast(context, msg: 'fBottomSheetOption close');
                });
              },
            ),
            SizedBox(height: 16),
            FButton(
              child: '自定义视图',
              onPressed: () {
                FBottomSheet.fBottomSheetView(context,
                    roundTop: true,
                    isDismissible: false,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 40),
                              Expanded(
                                child: Text('蒙版点击无效', textAlign: TextAlign.center),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context, 'hello'),
                                icon: Icon(Icons.clear, size: 24),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                ListTile(leading: Icon(Icons.add), title: Text('新增')),
                                ListTile(leading: Icon(Icons.email), title: Text('邮件')),
                                ListTile(leading: Icon(Icons.phone), title: Text('电话')),
                                ListTile(leading: Icon(Icons.cloud_upload), title: Text('上传')),
                                ListTile(leading: Icon(Icons.account_box), title: Text('用户')),
                                ListTile(leading: Icon(Icons.email), title: Text('邮件')),
                                ListTile(leading: Icon(Icons.phone), title: Text('电话')),
                                ListTile(leading: Icon(Icons.cloud_upload), title: Text('上传')),
                                ListTile(leading: Icon(Icons.account_box), title: Text('用户')),
                                TextField(decoration: InputDecoration(hintText: '请输入内容')),
                                SizedBox(height: 16),
                                FButton(child: '确定', onPressed: () => Navigator.pop(context, 'sure'))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )).then((data) {
                  print('test data=$data');
                  FToast.showToast(context, msg: 'fBottomSheetView close');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
