import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:personal_mushaf/src/widgets/dual_quran_pager.dart';
import 'package:personal_mushaf/src/widgets/single_quran_pager.dart';

class QuranViewer extends StatefulWidget {
  final int initialPage;

  QuranViewer({this.initialPage});
  QuranViewerState createState() => QuranViewerState(initialPage);
}

class QuranViewerState extends State<QuranViewer> {
  PageController pageController;
  FullScreen fullscreen;
  int currentPageNumber;

  QuranViewerState(this.currentPageNumber);

  initState() {
    super.initState();
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
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return SingleQuranPager(
                  initialPageNumber: currentPageNumber,
                  onPageChanged: (int pageNumber) {
                    currentPageNumber = pageNumber;
                  });
            } else {
              return DualQuranPager(
                  initialPageNumber: currentPageNumber,
                  onPageChanged: (int pageNumber) {
                    currentPageNumber = pageNumber;
                  });
            }
          },
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
