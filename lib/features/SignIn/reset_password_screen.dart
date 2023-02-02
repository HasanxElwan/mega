import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/features/SignIn/sign_in_screen.dart';
import '../../bloc/signIn/login_cubit.dart';
import '../../bloc/signIn/login_states.dart';
import '../../core/components/components.dart';
import '../../core/components/shared_component.dart';
import '../../core/resources/textstyle_manager.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SignInCubit cubit = SignInCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: responsiveHeight(context) / 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: FadeInRight(
                  child: Column(
                    children: [
                      const LogoWithText(
                          firstText: "Reset Password", secondText: ''),
                      SizedBox(
                        height: responsiveHeight(context) / 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context) / 25,
                            vertical: responsiveHeight(context) / 30),
                        child: Form(
                          key: cubit.resetPasswordformKey,
                          child: Column(
                            children: [
                              DefaultFormField(
                                  hint: 'New Password',
                                  prefix: Icons.lock_outline_rounded,
                                  controller: cubit.resetpasswordController,
                                  isPassword: cubit.password,
                                  suffix: cubit.password
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  suffixPress: () {
                                    cubit.changeVisabilty(1);
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password must not be empty';
                                    } else {
                                      if (value.length < 6) {
                                        return 'Password must be more than 6 character';
                                      }
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.visiblePassword),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              DefaultFormField(
                                  hint: 'Confirm Password',
                                  prefix: Icons.lock_outline_rounded,
                                  controller:
                                      cubit.confirmResetpasswordController,
                                  isPassword: cubit.newPassword,
                                  suffix: cubit.newPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  suffixPress: () {
                                    cubit.changeVisabilty(2);
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password must not be empty';
                                    } else {
                                      if (cubit.confirmResetpasswordController
                                              .text !=
                                          cubit.resetpasswordController.text) {
                                        return 'Password must be more than 6 character';
                                      }
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.visiblePassword),
                              SizedBox(
                                height: responsiveHeight(context) / 10,
                              ),
                              DefaultButton(
                                  child: Text(
                                    'Conirm',
                                    style: AppTextStyle.buttonText,
                                  ),
                                  onPressed: () {
                                    if (cubit.resetPasswordformKey.currentState!
                                        .validate()) {
                                      navigatAndReplacement(context,
                                          screen: const SignInScreen());
                                    }
                                  })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
