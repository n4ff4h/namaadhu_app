import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF051139);
const kPrimaryColor = Color(0xFF4AD0EE);

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
