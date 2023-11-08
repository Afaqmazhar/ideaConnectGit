import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? title,String? hint,controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.black).fontFamily('Arial').size(10).make(),
      5.heightBox,
      TextFormField(
        decoration:
          InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'Arial',color: Colors.black),
          isDense:true,
          fillColor: const Color(0xFFD9D9D9),
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10),),
        ),
      ),
      5.heightBox,
    ],
  );
}