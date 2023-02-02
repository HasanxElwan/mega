import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/signUp/register_cubit.dart';
import '../../bloc/signUp/register_states.dart';
import '../../core/components/components.dart';
import '../../core/components/shared_component.dart';
import '../../core/resources/textstyle_manager.dart';
import '../../core/resources/colors_manager.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';
import '../Home/Home Screens/home.dart';
import '../SignIn/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  String? name;
  String? email;
  String? password;
  String? phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SignUpCubit cubit = SignUpCubit.get(context);
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
                          firstText: 'Let\'s Get Started',
                          secondText: 'Create a new account'),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context) / 25,
                            vertical: responsiveHeight(context) / 30),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              DefaultFormField(
                                  onChanged: (data) {
                                    name = data;
                                  },
                                  hint: 'Full Name',
                                  prefix: Icons.person_outline,
                                  controller: cubit.nameController,
                                  inputType: TextInputType.name,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Full Name must not be empty';
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: responsiveHeight(context) / 80,
                              ),
                              DefaultFormField(
                                  onChanged: (data) {
                                    email = data;
                                  },
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
                                  }),
                              SizedBox(
                                height: responsiveHeight(context) / 80,
                              ),
                              DefaultFormField(
                                  onChanged: (data) {
                                    phone = data;
                                  },
                                  hint: 'Your Phone',
                                  prefix: Icons.call,
                                  controller: cubit.phoneController,
                                  inputType: TextInputType.phone,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone must not be empty';
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: responsiveHeight(context) / 80,
                              ),
                              DefaultFormField(
                                  onChanged: (data) {
                                    password = data;
                                  },
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
                                  }),
                              SizedBox(
                                height: responsiveHeight(context) / 80,
                              ),
                              DefaultFormField(
                                  hint: 'Confirm password',
                                  prefix: Icons.lock_outline,
                                  controller: cubit.confirmPasswordController,
                                  inputType: TextInputType.visiblePassword,
                                  isPassword: true,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password must not be empty';
                                    } else {
                                      if (cubit
                                              .confirmPasswordController.text !=
                                          cubit.passwordController.text) {
                                        return 'Password must be more than 6 character';
                                      }
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: responsiveHeight(context) / 30,
                              ),
                              DefaultButton(
                                  child: Text(
                                    'Sign Up',
                                    style: AppTextStyle.buttonText,
                                  ),
                                  onPressed: () {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      navigatAndReplacement(context,
                                          screen: const HomeLayout());
                                    }
                                  }),
                              SizedBox(
                                height: responsiveHeight(context) / 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'have a account? ',
                                    style: AppTextStyle.greyBold
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      navigatTo(context,
                                          screen: const SignInScreen());
                                    },
                                    child: Ink(
                                      child: Text('Sign In',
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
                      ),
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
