import 'package:flutter/material.dart';

class Merchant {
  final String name;
  final String? logoPath;
  final Color backgroundColor;
  final Color? merchantTextColor;

  Merchant({
    required this.name,
    this.logoPath,
    required this.backgroundColor,
    this.merchantTextColor,
  });
}
