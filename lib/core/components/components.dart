import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega/core/components/shared_component.dart';

import '../../bloc/App/app_cubit.dart';
import '../../features/Home/product/product_details_screen.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../resources/colors_manager.dart';
import '../resources/textstyle_manager.dart';
import '../utils/helper_functions.dart';
import '../utils/responsive.dart';

// ignore: must_be_immutable
class DefaultFormField extends StatelessWidget {
  final String hint;
  final IconData prefix;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final TextInputType inputType;
  IconData? suffix;
  bool? isPassword;
  VoidCallback? suffixPress;
  Function(String)? onChanged;

  DefaultFormField(
      {super.key,
      required this.hint,
      required this.prefix,
      required this.controller,
      required this.validate,
      required this.inputType,
      this.suffix,
      this.isPassword,
      this.suffixPress,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validate,
      keyboardType: inputType,
      controller: controller,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.grey.withOpacity(.5),
          ),
        ),
        labelText: hint,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          icon: Icon(suffix),
          onPressed: suffixPress,
        ),
      ),
    );
  }
}

class DefaultProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String trail;
  final VoidCallback onpressed;
  const DefaultProfileTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.trail,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpressed,
      leading: Icon(
        icon,
        size: 25,
        color: AppColors.brown,
      ),
      title: Text(
        title,
        style: AppTextStyle.profile.copyWith(fontSize: 15),
      ),
      dense: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: responsiveWidth(context) / 4,
            child: Text(
              trail,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.details.copyWith(fontSize: 12),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DefaultButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  double? elevation;
  Color? color;
  double? height;
  double? width;
  BorderSide? borderSide;

  DefaultButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.elevation,
      this.color,
      this.height,
      this.width,
      this.borderSide});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: MaterialButton(
        height: height ?? responsiveHeight(context) / 13,
        onPressed: onPressed,
        elevation: elevation ?? 2,
        padding: EdgeInsets.zero,
        color: color ?? AppColors.buttonColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: borderSide ?? BorderSide.none),
        child: child,
      ),
    );
  }
}

class CircleCategoryComponent extends StatelessWidget {
  final CategoryModel model;

  const CircleCategoryComponent({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Colors.grey.withOpacity(.1),
          hoverColor: Colors.grey.withOpacity(.5),
          onTap: () {
            navigatTo(context,
                screen: BlocProvider.value(
                    value: AppCubit.get(context), child: Container()));
          },
          child: Ink(
            child: Column(
              children: [
                Container(
                    height: responsiveHeight(context) / 7.9,
                    width: responsiveWidth(context) / 3.4,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    clipBehavior: Clip.antiAlias,
                    child: ImageWithFadeIn(image: model.image)),
                SizedBox(
                  height: responsiveHeight(context) / 120,
                ),
                SizedBox(
                  width: responsiveWidth(context) / 4,
                  child: Text(
                    model.categoryName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.categoryStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductComponent extends StatelessWidget {
  final ProductModel model;
  const ProductComponent({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            navigatTo(context,
                screen: BlocProvider.value(
                    value: AppCubit.get(context),
                    child: ProductDetailsScreen(model: model)));
          },
          child: Ink(
            height: responsiveHeight(context) / 3.2,
            width: responsiveWidth(context) / 2.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: responsiveHeight(context) / 5.3,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                        clipBehavior: Clip.antiAlias,
                        child: ImageWithFadeIn(
                          image: model.image,
                        )),
                    IconButton(
                      onPressed: () {
                        AppCubit.get(context)
                            .changeFavourite(model.isFavourite, model);
                      },
                      icon: model.isFavourite
                          ? const Icon(
                              Icons.favorite,
                              color: Color(0xffFB7181),
                              size: 28,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 28,
                            ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: responsiveHeight(context) / 150,
                    ),
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.itemName,
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 150,
                    ),
                    Text(
                      r'$' '${model.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.itemName,
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 150,
                    ),
                    model.discount > 0
                        ? Row(
                            children: [
                              Text(
                                r'$' '${model.oldPrice}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.discount,
                              ),
                              SizedBox(
                                width: responsiveWidth(context) / 40,
                              ),
                              Text(
                                '${model.discount}% off',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.discount.copyWith(
                                    color: AppColors.buttonColor,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewComponent extends StatelessWidget {
  final Review review;
  const ReviewComponent({super.key, required this.review});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: responsiveHeight(context) / 10,
              width: responsiveWidth(context) / 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: ImageWithFadeIn(image: review.image),
            ),
            SizedBox(
              width: responsiveWidth(context) / 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: AppTextStyle.itemName.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 100,
                ),
                RateComponent(
                    rate: review.rate, size: responsiveHeight(context) / 32)
              ],
            ),
          ],
        ),
        SizedBox(
          height: responsiveHeight(context) / 50,
        ),
        Text(
          review.review,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details,
        ),
        SizedBox(
          height: responsiveHeight(context) / 80,
        ),
        Text(
          review.date,
          style: AppTextStyle.details,
        ),
      ],
    );
  }
}

class DefaultStepper extends StatefulWidget {
  const DefaultStepper({super.key});

  @override
  State<DefaultStepper> createState() => _DefaultStepperState();
}

int current = 0;

class _DefaultStepperState extends State<DefaultStepper> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveHeight(context) / 6.5,
      child: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.light(primary: HexColor('#087DA9'))),
        child: Stepper(
          elevation: 0,
          // physics: const BouncingScrollPhysics(),
          controlsBuilder: (context, details) {
            return Container();
          },
          type: StepperType.horizontal,
          currentStep: current,
          steps: [
            Step(
              label: const Text('Packing'),
              title: const Text(''),
              content: const SizedBox(),
              state: StepState.complete,
              isActive: current >= 0 ? true : false,
            ),
            Step(
              title: const Text(''),
              content: const SizedBox(),
              label: const Text('Shipping'),
              state: StepState.complete,
              isActive: current >= 1 ? true : false,
            ),
            Step(
              title: const Text(''),
              content: const SizedBox(),
              label: const Text('Arriving'),
              state: StepState.complete,
              isActive: current >= 2 ? true : false,
            ),
            Step(
              title: const Text(''),
              content: const SizedBox(),
              label: const Text('Success'),
              state: StepState.complete,
              isActive: current >= 3 ? true : false,
            ),
          ],
          onStepTapped: (value) {
            setState(() {
              current = value;
              // print(current);
            });
          },
        ),
      ),
    );
  }
}

Future<bool?> showToast({required String text, required Color color}) async {
  await Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
  return null;
}
