import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('World Time'),
      centerTitle: true,
    ),
    body: Center(
      child: Text('India'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: null,
      child: Text('click'),
    ),
  ),
));

