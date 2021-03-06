import 'package:example/bean/HomeBean.dart';
import 'package:example/comm/comm.dart';
import 'package:example/view/badge.dart';
import 'package:example/view/bottomsheet.dart';
import 'package:example/view/bubble.dart';
import 'package:example/view/button.dart';
import 'package:example/view/checkbox.dart';
import 'package:example/view/dialog.dart';
import 'package:example/view/drawer.dart';
import 'package:example/view/marquee.dart';
import 'package:example/view/number.dart';
import 'package:example/view/operation.dart';
import 'package:example/view/preview.dart';
import 'package:example/view/pwdfield.dart';
import 'package:example/view/radio.dart';
import 'package:example/view/skeleton.dart';
import 'package:example/view/star.dart';
import 'package:example/view/swipe.dart';
import 'package:example/view/textfield.dart';
import 'package:example/view/toast.dart';
import 'package:example/view/triangle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<HomeBean> list = [
    HomeBean(name: 'toast', page: ToastDemo()),
    HomeBean(name: 'button', page: ButtonDemo()),
    HomeBean(name: 'textfield', page: TextFieldDemo()),
    HomeBean(name: 'pwdfield', page: PwdFieldDemo()),
    HomeBean(name: 'Badge', page: BadgeDemo()),
    HomeBean(name: 'dialog', page: DialogDemo()),
    HomeBean(name: 'bottomsheet', page: BottomSheetDemo()),
    HomeBean(name: 'number', page: NumberDemo()),
    HomeBean(name: 'swipe', page: SwipeDemo()),
    HomeBean(name: 'preView', page: PreViewDemo()),
    HomeBean(name: 'marquee', page: MarqueeDemo()),
    HomeBean(name: 'star', page: StarDemo()),
    HomeBean(name: 'triangle', page: TriangleDemo()),
    HomeBean(name: 'bubble', page: BubbleDemo()),
    HomeBean(name: 'radio', page: RadioDemo()),
    HomeBean(name: 'checkbox', page: CheckBoxDemo()),
    HomeBean(name: 'operation', page: OperationDemo()),
    HomeBean(name: 'drawer', page: DrawerDemo()),
    HomeBean(name: 'skeleton', page: SkeletonDemo()),
  ];

  Widget getItemContainer(int position) {
    HomeBean bean = list[position];
    return GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => bean.page));
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: Text(
          bean.name,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Comm.getTitleBar(title: 'Home'),
      body: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) => getItemContainer(index),
      ),
    );
  }
}
