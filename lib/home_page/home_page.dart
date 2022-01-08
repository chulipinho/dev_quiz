import 'package:devquiz/challenge_page/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home_page/home_controller.dart';
import 'package:devquiz/home_page/home_state.dart';
import 'package:devquiz/home_page/widgets/app_bar_widget.dart';
import 'package:devquiz/home_page/widgets/level_button_widget.dart';
import 'package:devquiz/home_page/widgets/quiz_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.loadData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.succes) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppColors.darkGreen),),
        ),
      );
    }
    return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StaggeredGrid.count(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage()));
                          },
                            title: e.title,
                            percentage:
                                e.questionsAnswered / e.questions.length,
                            completed:
                                "${e.questionsAnswered} de ${e.questions.length}"),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
