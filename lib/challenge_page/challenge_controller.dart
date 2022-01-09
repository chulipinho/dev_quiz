import 'package:flutter/cupertino.dart';

class ChallegeController {
  final curentPageNotifier = ValueNotifier<int>(1);
  int corectAnswers = 0;

  int get curentPage => curentPageNotifier.value;
  set curentPage(value) => curentPageNotifier.value = value;
}
