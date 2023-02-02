import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/components.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/responsive.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context) / 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: responsiveHeight(context) / 10,
                    width: responsiveWidth(context),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: HexColor('#1B8900')),
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(context) / 50,
                  ),
                  Text(
                    'Success',
                    style: AppTextStyle.appBar
                        .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: responsiveHeight(context) / 50,
                  ),
                  Column(
                    children: [
                      Text(
                        'Thank You for Shipping from',
                        style: AppTextStyle.appBar
                            .copyWith(color: AppColors.grey, fontSize: 18),
                      ),
                      Text(
                        'MEGA Store',
                        style: AppTextStyle.appBar
                            .copyWith(color: AppColors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: responsiveHeight(context) / 20,
                  ),
                  DefaultButton(
                      color: AppColors.lightblack,
                      child: Text(
                        'Back To Home',
                        style: AppTextStyle.buttonText
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        AppCubit.get(context).signOut(context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
