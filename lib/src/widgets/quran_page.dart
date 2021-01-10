import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
  final int pageNumber;

  QuranPage({@required this.pageNumber});

  QuranPageState createState() {
    return QuranPageState();
  }
}

class QuranPageState extends State<QuranPage> {
  QuranPageState();

  Widget build(context) {
    return singlePage(widget.pageNumber);
  }

  Widget singlePage(int pageNumber) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Image(
        image:
            AssetImage('lib/res/ClassicMadani15/classicmadani15_pg_$pageNumber.png'),
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
