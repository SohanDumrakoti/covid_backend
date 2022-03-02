import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsValues.defaultColor,
      elevation: 1,
      child: ListTile(
        title: Text(title),
        trailing: Text("$value"),
      ),
    );
  }
}
