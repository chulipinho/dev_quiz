import 'dart:html';

import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({
    Key? key,
    required this.label,
  }) : assert ( ["Fácil", "Médio", "Difícil", "Perito"].contains(label) ) , super(key: key);

  final config = {
    "Fácil" : {
      "color" : AppColors.levelButtonFacil,
      "fontColor" : AppColors.levelButtonTextFacil,
      "borderColor" : AppColors.levelButtonBorderFacil,
    },
    "Médio" : {
      "color" : AppColors.levelButtonMedio,
      "fontColor" : AppColors.levelButtonTextMedio,
      "borderColor" : AppColors.levelButtonBorderMedio,
    },
    "Difícil" : {
      "color" : AppColors.levelButtonDificil,
      "fontColor" : AppColors.levelButtonTextDificil,
      "borderColor" : AppColors.levelButtonBorderDificil,
    },
    "Perito" : {
      "color" : AppColors.levelButtonPerito,
      "fontColor" : AppColors.levelButtonTextPerito,
      "borderColor" : AppColors.levelButtonBorderPerito,
    }
  };

  Color get color => config[label]!["color"]!;
  Color get borderColor => config[label]!["borderColor"]!;
  Color get fontColor => config[label]!["fontColor"]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(
              BorderSide(color: borderColor))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              color: fontColor, fontSize: 13),
        ),
      ),
    );
  }
}
