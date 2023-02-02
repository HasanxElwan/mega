import 'package:flutter/material.dart';

import 'colors_manager.dart';

class AppTextStyle {
  static TextStyle loginHead1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle loginHead2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle greyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );
  static TextStyle greyBold1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );

  static TextStyle categoryStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.categoryName,
  );

  static TextStyle sideTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    shadows: const [
      Shadow(blurRadius: 5, color: Colors.grey, offset: Offset(0, 3))
    ],
    color: AppColors.buttonColor,
  );
  static TextStyle itemName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle discount = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.grey,
      decoration: TextDecoration.lineThrough);

  static TextStyle appBar = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle details = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: AppColors.description,
  );

  static TextStyle profile = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
}
