import 'package:devquiz/challenge_page/widgets/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;
  const ResultPage({Key? key, required this.result, required this.title, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu\n",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: "${title}",
                            style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: "\ncom ${result} de ${length} acertos",
                            style: AppTextStyles.body),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar", onTap: () {
                            Share.share("Acertei ${result}/${length} no ${title}!!!");
                          }),
                    )),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.transparent(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
