import 'package:devquiz/challenge_page/widgets/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64,),
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(title: "Pergunta"),
          AnswerWidget(title: "Pergunta2", isRight: true, isSelected: true,),
          AnswerWidget(title: "Pergunta3"),
          AnswerWidget(title: "Pergunta4")
        ],
      ),
    );
  }
}
