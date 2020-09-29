import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';
import 'widgets/navigation_tab.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> tabTitles = ['JUZ', 'RUKU', 'SURAH'];

  @override
  Widget build(BuildContext context) {
    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Color.fromRGBO(50, 53, 58, 1),
        statusBarColor: Color.fromRGBO(50, 53, 58, 1));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: mySystemTheme,
      child: DefaultTabController(
        length: 3,
        child: ColorfulSafeArea(
          color: Color.fromRGBO(35, 38, 41, 1),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(50, 53, 58, 1),
              brightness: Brightness.dark,
              title: Text(
                'Qur\'an Contents',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              bottom: ColoredTabBar(
                Color.fromRGBO(35, 38, 41, 1),
                TabBar(
                  indicatorColor: Colors.white,
                  tabs: tabTitles
                      .map((title) => Tab(
                            text: title,
                          ))
                      .toList(),
                ),
              ),
              actions: <Widget>[
                PopupMenuTheme(
                  data: PopupMenuThemeData(color: Color.fromRGBO(50, 53, 58, 1), textStyle: TextStyle(color: Colors.white)),
                  child: PopupMenuButton<String>(
                    onSelected: (value) {},
                    itemBuilder: (BuildContext context) {
                      return {'Logout', 'Settings'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: [
                NavigationTab(
                  numOfItems: 30,
                  title: 'Juz',
                  subtitle: '30',
                ),
                NavigationTab(
                  numOfItems: 16,
                  title: 'Ruku',
                  subtitle: '40',
                ),
                NavigationTab(
                  numOfItems: 114,
                  title: 'Surah',
                  subtitle: '50',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  ColoredTabBar(this.color, this.tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: tabBar,
      );
}
