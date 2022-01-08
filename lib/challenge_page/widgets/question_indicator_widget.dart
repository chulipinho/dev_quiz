import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int curentPage;
  final int lengh;
  const QuestionIndicatorWidget({Key? key, required this.curentPage, required this.lengh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão ${curentPage}", style: AppTextStyles.body,),
              Text("${curentPage} de ${lengh}", style: AppTextStyles.body,),
            ],
          ),
          SizedBox(height: 16,),
          ProgressIndicatorWidget(value: curentPage / lengh),
        ],
      ),
    );
  }
}
