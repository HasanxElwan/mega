import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/responsive.dart';
import '../Home Screens/home.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: responsiveWidth(context) / 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: responsiveHeight(context) / 10,
                  width: responsiveWidth(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: HexColor('#FB7181')),
                  child: const Icon(
                    Icons.priority_high,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 50,
                ),
                Text(
                  'Confirmation',
                  style: AppTextStyle.appBar
                      .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 50,
                ),
                Column(
                  children: [
                    Text(
                      'Are you sure wanna delete your account',
                      style: AppTextStyle.appBar
                          .copyWith(color: AppColors.grey, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 20,
                ),
                DefaultButton(
                    child: Text(
                      'Delete',
                      style:
                          AppTextStyle.buttonText.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      navigatAndReplacement(context,
                          screen: const HomeLayout());
                    }),
                SizedBox(
                  height: responsiveHeight(context) / 50,
                ),
                DefaultButton(
                    elevation: 0,
                    borderSide: BorderSide(width: .5, color: AppColors.grey),
                    color: Colors.white,
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.buttonText
                          .copyWith(color: AppColors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ));
  }
}
