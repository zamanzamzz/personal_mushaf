import 'package:flutter/material.dart';
import 'package:personal_mushaf/src/widgets/quran_page.dart';

import 'quran_page.dart';

class SingleQuranPager extends StatefulWidget {
  final int initialPageNumber;
  final void Function(int) onPageChanged;

  SingleQuranPager(
      {@required this.initialPageNumber, @required this.onPageChanged});

  SingleQuranPagerState createState() {
    return SingleQuranPagerState();
  }
}

class SingleQuranPagerState extends State<SingleQuranPager> {
  PageController pageController;
  int currentPageNumber;

  initState() {
    super.initState();
    currentPageNumber = widget.initialPageNumber;
    pageController = PageController(initialPage: pageNumberToIndex(currentPageNumber));
  }

  Widget build(context) {
    return PageView.builder(
        onPageChanged: (value) {
          currentPageNumber = indexToPageNumber(value);
          widget.onPageChanged(currentPageNumber);
        },
        controller: pageController,
        reverse: true,
        itemCount: 604,
        itemBuilder: (context, index) =>
            QuranPage(pageNumber: indexToPageNumber(index)));
  }

  int pageNumberToIndex(int pageNumber) {
    return pageNumber - 1;
  }

  int indexToPageNumber(int index) {
    return index + 1;
  }
}
