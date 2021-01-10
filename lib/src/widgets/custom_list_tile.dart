import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final double portionLength;
  final int pageNumber;
  final String leading;
  final Color color;
  final VoidCallback onTap;

  CustomListTile(
      {this.portionLength,
      this.pageNumber,
      this.color,
      this.leading,
      this.onTap});

  Widget build(context) {
    return Ink(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        splashColor: Colors.grey,
        highlightColor: Colors.black12,
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              child: Text(
                leading,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Positioned(
              left: 64,
              top: 15,
              child: Text(
                '${portionLength.toStringAsFixed(2)} pages',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 64,
              bottom: 15,
              child: Text(
                '$pageNumber',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 24,
              child: Text(
                'وَإِذِ اسْتَسْقَىٰ مُوسَىٰ لِقَوْمِهِ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
          alignment: Alignment.center,
        ),
      ),
      color: color,
    );
  }
}
