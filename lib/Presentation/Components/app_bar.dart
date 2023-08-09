import 'package:flutter/material.dart';

AppBar buildAppBar({
  required String appBarTitle,
  bool? centerTitle,
  List<Widget>? actionWidgets,
}) =>
    AppBar(
      title: Text(appBarTitle),
      centerTitle: centerTitle ?? true,
      backgroundColor: const Color(0xFF043d33),
      actions: actionWidgets ?? [],
    );
