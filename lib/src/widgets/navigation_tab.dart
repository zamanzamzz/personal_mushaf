import 'package:flutter/material.dart';
import 'package:personal_mushaf/src/mixins/navigation_mixins/classic_madani_15_nav.dart';
import 'package:personal_mushaf/src/mixins/string_resource_mixins/classic_madani_15_strings.dart';
import 'custom_list_tile.dart';

class NavigationTab extends StatefulWidget {
  final List<int> pageNumbers;
  final List<double> lengths;
  final List<String> prefixes;

  NavigationTab({
    @required this.pageNumbers,
    @required this.lengths,
    @required this.prefixes,
  });

  NavigationTabState createState() {
    return NavigationTabState();
  }
}

class NavigationTabState extends State<NavigationTab>
    with AutomaticKeepAliveClientMixin<NavigationTab>, ClassicMadani15Nav {
  @override
  bool get wantKeepAlive => true;

  NavigationTabState();

  Widget build(context) {
    super.build(context);
    return ListView.builder(
      itemCount: widget.lengths.length,
      itemBuilder: (context, index) {
        return CustomListTile(
          portionLength: widget.lengths[index],
          pageNumber: widget.pageNumbers[index],
          leading: arabicNumerals[index],
          prefix: widget.prefixes[index],
          color: index % 2 == 0
              ? Color.fromRGBO(50, 53, 58, 1)
              : Color.fromRGBO(35, 38, 41, 1),
          onTap: () {},
        );
      },
    );
  }
}
