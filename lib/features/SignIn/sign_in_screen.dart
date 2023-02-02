import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/signIn/login_cubit.dart';
import '../../bloc/signIn/login_states.dart';
import '../../core/components/components.dart';
import '../../core/components/shared_component.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';
import '../../core/resources/textstyle_manager.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../Home/Home Screens/home.dart';
import '../SignUp/sign_up_screen.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, LoginStates>(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWithText(
                          firstText: 'Welcome to MEGA Store',
                          secondText: 'Sign in to continue'),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context) / 25,
                            vertical: responsiveHeight(context) / 30),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              DefaultFormField(
                                hint: 'Your Email',
                                prefix: Icons.mail_outline_outlined,
                                controller: cubit.emailController,
                                inputType: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email must not be empty';
                                  } else {
                                    if (!value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              DefaultFormField(
                                hint: 'Password',
                                prefix: Icons.lock_outline,
                                controller: cubit.passwordController,
                                inputType: TextInputType.visiblePassword,
                                isPassword: true,
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
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              DefaultButton(
                                child: Text(
                                  'Sign In',
                                  style: AppTextStyle.buttonText,
                                ),
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    navigatAndReplacement(context,
                                        screen: const HomeLayout());
                                  }
                                },
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 30,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: responsiveWidth(context) / 2.8,
                                    height: .5,
                                    color: AppColors.grey,
                                  ),
                                  SizedBox(
                                    width: responsiveWidth(context) / 15,
                                  ),
                                  Text(
                                    'OR',
                                    style: AppTextStyle.greyBold,
                                  ),
                                  SizedBox(
                                    width: responsiveWidth(context) / 15,
                                  ),
                                  Container(
                                    width: responsiveWidth(context) / 2.8,
                                    height: .5,
                                    color: AppColors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              DefaultButton(
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {},
                                borderSide: BorderSide(
                                    color: AppColors.grey.withOpacity(.3),
                                    width: 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          responsiveWidth(context) / 12),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageAssets.google),
                                        height: responsiveHeight(context) / 25,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: responsiveWidth(context) / 8.5,
                                      ),
                                      Text(
                                        'Login with Google',
                                        style: AppTextStyle.greyBold,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 80,
                              ),
                              DefaultButton(
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {},
                                borderSide: BorderSide(
                                    color: AppColors.grey.withOpacity(.3),
                                    width: 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          responsiveWidth(context) / 12),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageAssets.faceBook),
                                        height: responsiveHeight(context) / 25,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: responsiveWidth(context) / 8.5,
                                      ),
                                      Text('Login with Facebook',
                                          style: AppTextStyle.greyBold,
                                          textAlign: TextAlign.center)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 80,
                              ),
                              InkWell(
                                onTap: () {
                                  navigatTo(context,
                                      screen: BlocProvider.value(
                                          value: SignInCubit.get(context),
                                          child: const ForgetPasswordScreen()));
                                },
                                child: Ink(
                                  child: Text('Forget Password?',
                                      style: AppTextStyle.greyBold1.copyWith(
                                        color: AppColors.buttonColor,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have a account? ',
                                    style: AppTextStyle.greyBold1
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      navigatTo(context,
                                          screen: SignUpScreen());
                                    },
                                    child: Ink(
                                      child: Text('Register',
                                          style: AppTextStyle.greyBold.copyWith(
                                            color: AppColors.buttonColor,
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
