import 'package:flutter/material.dart';
import 'custom_list_tile.dart';

class NavigationTab extends StatefulWidget {
  final int numOfItems;
  final String title;
  final String subtitle;

  NavigationTab({this.numOfItems, this.title, this.subtitle});

  NavigationTabState createState() {
    return NavigationTabState(
        numOfItems: numOfItems, title: title, subtitle: subtitle);
  }
}

class NavigationTabState extends State<NavigationTab>
    with AutomaticKeepAliveClientMixin<NavigationTab> {
  final int numOfItems;
  final String title;
  final String subtitle;

  @override
  bool get wantKeepAlive => true;

  NavigationTabState({this.numOfItems, this.title, this.subtitle});

  Widget build(context) {
    super.build(context);
    return ListView.builder(
      itemCount: numOfItems,
      itemBuilder: (context, index) {
        return CustomListTile(
          title: '$title ${index + 1}',
          subtitle: '$subtitle pages',
          color: index % 2 == 0
              ? Color.fromRGBO(50, 53, 58, 1)
              : Color.fromRGBO(35, 38, 41, 1),
          onTap: () {},
        );
      },
    );
  }
}
