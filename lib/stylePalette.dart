import 'package:flutter/material.dart';
import 'dart:ui';

var kTopHeadingWhite = TextStyle(
  color: Colors.white,
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  shadows: [
    Shadow(color: Colors.black, offset: Offset(-3, 3.0), blurRadius: 7.0),
  ],
);

var kSubtitleWhite =
    TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500);

var kSubtitleGrey = TextStyle(
    color: Colors.blueGrey[900], fontSize: 18.0, fontWeight: FontWeight.w800);

var kTitleListenElement = TextStyle(
    color: Colors.blueGrey[900], fontSize: 16.0, fontWeight: FontWeight.w500);

var kSubTitleListenElement = TextStyle(
    color: Colors.blueGrey[900], fontSize: 16.0, fontWeight: FontWeight.w400);
