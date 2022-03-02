import 'package:flutter/material.dart';
import '../values/colors_values.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);
  final String title;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Container(
          color: ColorsValues.defaultColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: ColorsValues.defaultColor,
                child: Image.asset(
                  "assets/icons/viruses.png",
                  color: color,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Center(
                  child: Text(
                "$value",
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
