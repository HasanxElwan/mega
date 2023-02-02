import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/signIn/login_cubit.dart';
import '../../bloc/signIn/login_states.dart';
import '../../core/components/components.dart';
import '../../core/components/shared_component.dart';
import '../../core/resources/textstyle_manager.dart';
import '../../core/utils/helper_functions.dart';
import '../../core/utils/responsive.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                child: FadeInRight(
                  child: Column(
                    children: [
                      const LogoWithText(
                        firstText: "Forget Password",
                        secondText: "Add your email to send code",
                      ),
                      SizedBox(
                        height: responsiveHeight(context) / 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context) / 25,
                            vertical: responsiveHeight(context) / 30),
                        child: Form(
                          key: cubit.formKeyForgetPassword,
                          child: Column(
                            children: [
                              DefaultFormField(
                                  hint: ' You email',
                                  prefix: Icons.email_outlined,
                                  controller: cubit.forgetpasswordController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "Email must not be empty";
                                    } else {
                                      if (!value.contains('@')) {
                                        return "Please enter a valid email";
                                      }
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.emailAddress),
                              SizedBox(
                                height: responsiveHeight(context) / 20,
                              ),
                              DefaultButton(
                                  child: Text(
                                    'Send',
                                    style: AppTextStyle.buttonText,
                                  ),
                                  onPressed: () {
                                    if (cubit
                                        .formKeyForgetPassword.currentState!
                                        .validate()) {
                                      navigatTo(context,
                                          screen: BlocProvider.value(
                                              value: SignInCubit.get(context),
                                              child: Container()));
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),
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
