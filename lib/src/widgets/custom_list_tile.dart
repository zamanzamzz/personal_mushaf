import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  CustomListTile({this.title, this.subtitle, this.color, this.onTap});

  Widget build(context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 15,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 15,
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          alignment: Alignment.center,
        ),
        color: color,
      ),
    );
  }
}
