import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/responsive.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: 'Add Address', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context) / 30,
            vertical: responsiveHeight(context) / 70),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ButtomSheetForm(
                title: 'Country or Region',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Street Address',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Street Address 2 (Optional)',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'State/Province/Region',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'City',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Zip Code',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Phone Number',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: responsiveHeight(context) / 60,
              ),
              DefaultButton(
                  color: AppColors.brown,
                  child: Text(
                    'add address',
                    style: AppTextStyle.buttonText,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
