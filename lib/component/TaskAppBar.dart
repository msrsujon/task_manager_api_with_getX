import 'package:flutter/material.dart';
import 'package:task_manager_api/style/style.dart';

AppBar TaskAppBar(context, ProfileData) {
  return AppBar(
    backgroundColor: colorGreen,
    title: CircleAvatar(),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/taskCreate");
          },
          icon: Icon(Icons.add_circle_outline)),
      IconButton(onPressed: () async {}, icon: Icon(Icons.output))
    ],
  );
}
