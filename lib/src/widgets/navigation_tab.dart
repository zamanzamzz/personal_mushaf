import 'package:flutter/material.dart';
import 'custom_list_tile.dart';

class NavigationTab extends StatefulWidget {
  final int numOfItems;
  final String subtitle;

  NavigationTab({this.numOfItems, this.subtitle});

  NavigationTabState createState() {
    return NavigationTabState(numOfItems: numOfItems, subtitle: subtitle);
  }
}

class NavigationTabState extends State<NavigationTab>
    with AutomaticKeepAliveClientMixin<NavigationTab> {
  final int numOfItems;
  final String title;
  final String subtitle;

  final List<String> arabicNumerals = [
    '١',
    '٢',
    '٣',
    '٤',
    '٥',
    '٦',
    '٧',
    '٨',
    '٩',
    '١٠',
    '١١',
    '١٢',
    '١٣',
    '١٤',
    '١٥',
    '١٦',
    '١٧',
    '١٨',
    '١٩',
    '٢٠',
    '٢١',
    '٢٢',
    '٢٣',
    '٢٤',
    '٢٥',
    '٢٦',
    '٢٧',
    '٢٨',
    '٢٩',
    '٣٠',
  ];

  @override
  bool get wantKeepAlive => true;

  NavigationTabState({this.numOfItems, this.title, this.subtitle});

  Widget build(context) {
    super.build(context);
    return ListView.builder(
      itemCount: numOfItems,
      itemBuilder: (context, index) {
        return CustomListTile(
          pageNumber: '$subtitle pages',
          portionLength: '${index + 1}',
          leading: arabicNumerals[index % 30],
          color: index % 2 == 0
              ? Color.fromRGBO(50, 53, 58, 1)
              : Color.fromRGBO(35, 38, 41, 1),
          onTap: () {},
        );
      },
    );
  }
}
