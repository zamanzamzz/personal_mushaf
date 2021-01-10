import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';

class QuranPager extends StatefulWidget {
  final int initialPage;

  QuranPager({this.initialPage});
  QuranPagerState createState() => QuranPagerState();
}

class QuranPagerState extends State<QuranPager> {
  PageController pageController;
  FullScreen fullscreen;

  initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialPage);
    fullscreen = new FullScreen();
    fullscreen.enterFullScreen(FullScreenMode.EMERSIVE);
  }

  Widget build(context) {
    return WillPopScope(
      child: GestureDetector(
        onTap: () {
          fullscreen.isFullScreen.then((isFullScreen) {
            isFullScreen
                ? fullscreen.exitFullScreen()
                : fullscreen.enterFullScreen(FullScreenMode.EMERSIVE);
          });
        },
        child: PageView.builder(
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
        ),
      ),
      onWillPop: () async {
        bool isFullScreen = await fullscreen.isFullScreen;
        if (isFullScreen) {
          await fullscreen.exitFullScreen();
        }
        return true;
      },
    );
  }
}
