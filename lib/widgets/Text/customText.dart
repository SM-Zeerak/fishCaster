import 'package:fish_caster/import_file.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxline;
  final TextOverflow? overflow;
  final double? latterSpacing;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = ClrCons.whiteColor,
    this.decoration,
    this.textAlign,
    this.maxline,
    this.overflow,
    this.latterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      text,
      maxLines: maxline,
      style: TextStylesCons.custom(
          letterSpacing: latterSpacing ?? 0,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration),
      textAlign: textAlign,
    );
  }
}
