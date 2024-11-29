import 'package:flutter/material.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/movie_app.dart';

void main() async {
  Inject.init();
  runApp(const MovieApp());
}
