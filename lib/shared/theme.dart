import 'package:flutter/material.dart';
import 'package:namaadhu_vaguthu/shared/constants.dart';

final ThemeData theme = ThemeData.dark();

final appTheme = theme.copyWith(
  textTheme: theme.textTheme.apply(
    fontFamily: 'Poppins',
  ),
  primaryTextTheme: theme.textTheme.apply(
    fontFamily: 'Poppins',
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  colorScheme: theme.colorScheme.copyWith(
    primary: kPrimaryColor,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: kBackgroundColor,
  ),
);
