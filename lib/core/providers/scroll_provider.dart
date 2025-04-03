import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  double _scrollPosition = 0;

  double get scrollPosition => _scrollPosition;

  void updateScrollPosition(double position) {
    _scrollPosition = position;
    notifyListeners();
  }
}