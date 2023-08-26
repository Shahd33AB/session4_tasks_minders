import 'package:flutter/material.dart';

class   CustomSnackBar {
  static void show({required String content, required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(content),duration: const Duration(seconds: 2),)
    );
  }
}