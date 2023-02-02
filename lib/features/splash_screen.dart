import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mega/core/constants/constants.dart';

import '../core/resources/assets_manager.dart';
import '../core/utils/helper_functions.dart';
import 'SignIn/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    navigatAndReplacement(context, screen: const SignInScreen());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: (Colors.white),
      body: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
