import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/bloc/signUp/register_states.dart';

class SignUpCubit extends Cubit<RegisterStates> {
  SignUpCubit() : super(RegisterInitState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
}
