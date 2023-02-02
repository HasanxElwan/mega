import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class SignInCubit extends Cubit<LoginStates> {
  SignInCubit() : super(LoginInitState());

  static SignInCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController forgetpasswordController = TextEditingController();
  var formKeyForgetPassword = GlobalKey<FormState>();

  TextEditingController resetpasswordController = TextEditingController();
  TextEditingController confirmResetpasswordController =
      TextEditingController();
  var resetPasswordformKey = GlobalKey<FormState>();

  bool password = true;
  bool newPassword = true;
  changeVisabilty(int index) {
    if (index == 1) {
      password = !password;
      emit(ChangeVisabilityState());
    } else {
      if (index == 2) {
        newPassword = !newPassword;
        emit(ChangeVisabilityState());
      }
    }
  }
}
