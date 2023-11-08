import 'package:flutter/material.dart';
import 'package:ideafront/const/colors.dart';
import 'package:velocity_x/velocity_x.dart';
Widget LoginButton({required String title, onPress}){
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title.text.color(Colors.white).make(),
      ],
    ).box.rounded.size(400, 1).color(green).margin(const EdgeInsets.fromLTRB(0, 165, 0, 165)).shadowSm.make(),
  );
}