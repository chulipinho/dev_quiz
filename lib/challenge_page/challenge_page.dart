import 'package:devquiz/challenge_page/challenge_controller.dart';
import 'package:devquiz/challenge_page/widgets/next_button_widget.dart';
import 'package:devquiz/challenge_page/widgets/question_indicator_widget.dart';
import 'package:devquiz/challenge_page/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result_page/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final String title;
  final List<QuestionModel> questions;
  const ChallengePage({Key? key, required this.questions, required this.title}) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallegeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.curentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value)
      controller.corectAnswers++;
    
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.curentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  curentPage: value,
                  lengh: widget.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ValueListenableBuilder(
              valueListenable: controller.curentPageNotifier,
              builder: (context, value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value != widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: nextPage,
                      ),
                    ),
                  if (value == widget.questions.length)
                    SizedBox(
                      width: 7,
                    ),
                  if (value == widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(result: controller.corectAnswers,title: widget.title, length: widget.questions.length,)));
                        },
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
