import 'package:devquiz/challenge_page/widgets/next_button_widget.dart';
import 'package:devquiz/challenge_page/widgets/question_indicator_widget.dart';
import 'package:devquiz/challenge_page/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizWidget(title: "title"),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: NextButtonWidget.white(label: "Pular", onTap: () {},)),
              SizedBox(
                width: 7,
              ),
              Expanded(child: NextButtonWidget.green(label: "Confirmar", onTap: () {},)),
            ],
          ),
        ),
      ),
    );
  }
}
