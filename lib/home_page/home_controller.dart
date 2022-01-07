import 'package:devquiz/home_page/home_repository.dart';
import 'package:devquiz/home_page/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void loadData() async {
    state = HomeState.loading;
    user = await repository.getuser();
    quizzes = await repository.getQuizzes();
    state = HomeState.succes;
  }
}
