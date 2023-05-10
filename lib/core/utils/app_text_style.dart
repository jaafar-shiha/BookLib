import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const double _xSmallFontSize = 12.0;
  static const double _smallFontSize = 15.0;
  static const double _xRegularFontSize = 18.0;
  static const double _regularFontSize = 22.0;
  static const double _largeFontSize = 32.0;

  ///Black
  static final TextStyle latoSmallBoldBlack = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: _smallFontSize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle latoSmallBlack = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: _smallFontSize,
  );

  static final TextStyle latoRegularBoldBlack = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: _regularFontSize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle latoRegularBlack = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: _regularFontSize,
  );

  static final TextStyle latoLargeBoldBlack = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: _largeFontSize,
    fontWeight: FontWeight.bold,
  );

  ///Grey
  static final TextStyle latoXSmallBoldGrey = GoogleFonts.lato(
    color: AppColors.grey,
    fontSize: _xSmallFontSize,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle latoSmallGrey = GoogleFonts.lato(
    color: AppColors.grey,
    fontSize: _smallFontSize,
  );

  static final TextStyle latoXRegularGrey = GoogleFonts.lato(
    color: AppColors.grey,
    fontSize: _xRegularFontSize,
  );
  static final TextStyle latoRegularGrey = GoogleFonts.lato(
    color: AppColors.grey,
    fontSize: _regularFontSize,
  );

}
