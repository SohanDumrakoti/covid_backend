import 'package:flutter/material.dart';

class Options {
  final String? title;
  final IconData? icon;

  Options({this.title, this.icon});

  List<Options> optionItems = <Options>[
    Options(title: "About", icon: Icons.exit_to_app),
    Options(title: "Exit", icon: Icons.exit_to_app),
  ];
}
