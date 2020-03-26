import 'package:example/comm/theme_notification.dart';
import 'package:example/view/home_page.dart';
import 'package:fant/fant.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(IndexPage());
}

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ThemeNotification>(
      onNotification: (ThemeNotification bean) {
        if (bean.isDark) {
          themeMode = ThemeMode.dark;
        } else {
          themeMode = ThemeMode.system;

        }
        setState(() {});
        return true;
      },
      child: MaterialApp(
        title: 'Fant',
        darkTheme: kDarkTheme,
        theme: kLightTheme,
        themeMode: themeMode,
        home: HomePage(),
      ),
    );
  }
}
