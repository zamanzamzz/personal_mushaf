import 'package:flutter/material.dart';

import 'dual_quran_page.dart';

class DualQuranPager extends StatefulWidget {
  final int initialPageNumber;
  final void Function(int) onPageChanged;

  DualQuranPager(
      {@required this.initialPageNumber, @required this.onPageChanged});

  DualQuranPagerState createState() {
    return DualQuranPagerState();
  }
}

class DualQuranPagerState extends State<DualQuranPager> {
  PageController pageController;
  int currentPageNumber;

  initState() {
    super.initState();
    currentPageNumber = widget.initialPageNumber;
    pageController = PageController(
        initialPage: pageNumberToDualPageIndex(currentPageNumber));
  }

  Widget build(context) {
    return PageView.builder(
        onPageChanged: (value) {
          currentPageNumber = dualPageIndexToPageNumber(value);
          widget.onPageChanged(currentPageNumber);
        },
        controller: pageController,
        reverse: true,
        itemCount: 302,
        itemBuilder: (context, index) =>
            DualQuranPage(pageNumber: dualPageIndexToPageNumber(index)));
  }

  int pageNumberToDualPageIndex(int pageNumber) {
    if (pageNumber % 2 == 0)
      return (pageNumber / 2).floor() - 1;
    else
      return ((pageNumber - 1) / 2).floor();
  }

  int dualPageIndexToPageNumber(int dualPageIndex) {
    return dualPageIndex * 2 + 1;
  }
}
