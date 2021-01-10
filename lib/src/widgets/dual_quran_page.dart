import 'package:flutter/material.dart';

class DualQuranPage extends StatefulWidget {
  final int pageNumber;

  DualQuranPage({@required this.pageNumber});

  DualQuranPageState createState() {
    return DualQuranPageState();
  }
}

class DualQuranPageState extends State<DualQuranPage> {
  DualQuranPageState();

  Widget build(context) {
    return dualPage(widget.pageNumber);
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

  Widget dualPage(int pageNumber) {
    return Row(
      children: [
        Flexible(
          child: singlePage(pageNumber + 1),
        ),
        Flexible(
          child: singlePage(pageNumber),
        ),
      ],
    );
  }
}
