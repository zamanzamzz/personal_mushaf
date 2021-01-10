import 'package:flutter/material.dart';

class QuranPager extends StatefulWidget {
  final int initialPage;

  QuranPager({this.initialPage});
  QuranPagerState createState() => QuranPagerState();
}

class QuranPagerState extends State<QuranPager> {
  PageController pageController;

  initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialPage);
  }

  Widget build(context) {
    return PageView.builder(
      controller: pageController,
      reverse: true,
      itemCount: 604,
      itemBuilder: (context, index) => Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Image(
          image: AssetImage(
              'lib/res/ClassicMadani15/classicmadani15_pg_${index + 1}.png'),
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
