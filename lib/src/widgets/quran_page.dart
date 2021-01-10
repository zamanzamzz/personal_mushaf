import 'package:flutter/material.dart';

class QuranPage extends StatelessWidget {
  final int index;

  QuranPage({@required this.index});

  Widget build(context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return singlePage(index);
        } else {
          return Row(
            children: [
              Flexible(
                child: singlePage(index + 1),
              ),
              Flexible(
                child: singlePage(index),
              ),
            ],
          );
        }
      },
    );
  }

  Widget singlePage(int index) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Image(
        image: AssetImage(
            'lib/res/ClassicMadani15/classicmadani15_pg_${index + 1}.png'),
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
