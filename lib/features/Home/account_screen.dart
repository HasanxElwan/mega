import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/App/app_cubit.dart';
import '../../core/resources/colors_manager.dart';
import '../../core/resources/textstyle_manager.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../SignIn/sign_in_screen.dart';
import 'profile/address_screen.dart';
import 'profile/confimation_screen.dart';
import 'profile/my_orders.dart';
import 'profile/profile_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Account',
          style: AppTextStyle.appBar,
        ),
      ),
      body: FadeInRight(
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context) / 50,
              vertical: responsiveHeight(context) / 50),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  navigatTo(context,
                      screen: BlocProvider.value(
                          value: AppCubit.get(context),
                          child: ProfileScreen()));
                },
                leading: Icon(
                  Icons.person_outline,
                  size: 30,
                  color: AppColors.brown,
                ),
                title: Text(
                  'Profile',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: responsiveHeight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatTo(context, screen: const MyOrdersScreen());
                },
                leading: Icon(
                  Icons.outbox_rounded,
                  size: 30,
                  color: AppColors.brown,
                ),
                title: Text(
                  'My Orders',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: responsiveHeight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatTo(context,
                      screen: BlocProvider.value(
                          value: AppCubit.get(context),
                          child: const AddressScreen()));
                },
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: AppColors.brown,
                ),
                title: Text(
                  'Address',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: responsiveHeight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatAndReplacement(context, screen: const SignInScreen());
                },
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColors.brown,
                ),
                title: Text(
                  'Log out',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: responsiveHeight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatTo(context, screen: const ConfirmationScreen());
                },
                leading: Icon(
                  Icons.delete,
                  size: 30,
                  color: AppColors.buttonColor,
                ),
                title: Text(
                  'Delete Account',
                  style: AppTextStyle.profile,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
