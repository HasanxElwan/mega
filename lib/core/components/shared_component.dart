import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/App/app_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/textstyle_manager.dart';
import '../utils/responsive.dart';

class RateComponent extends StatelessWidget {
  final double rate;
  final double size;
  const RateComponent({super.key, required this.rate, required this.size});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: size,
      direction: Axis.horizontal,
    );
  }
}

class MyDashedSeparator extends StatelessWidget {
  const MyDashedSeparator(
      {Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class LogoWithText extends StatelessWidget {
  final String firstText;
  final String secondText;
  const LogoWithText({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: responsiveWidth(context) / 15),
              child: Image(
                image: const AssetImage(ImageAssets.splashLogo),
                height: responsiveWidth(context) / 4,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(
          height: responsiveHeight(context) / 30,
        ),
        Text(
          firstText,
          style: AppTextStyle.loginHead1,
        ),
        SizedBox(
          height: responsiveHeight(context) / 80,
        ),
        Text(
          secondText,
          style: AppTextStyle.loginHead2,
        ),
      ],
    );
  }
}

class ImageWithFadeIn extends StatelessWidget {
  final String image;
  const ImageWithFadeIn({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage(ImageAssets.search),
      image: NetworkImage(image),
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
    );
  }
}

class CarousalDots extends StatelessWidget {
  final List modelList;
  const CarousalDots({super.key, required this.modelList});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: modelList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () =>
              AppCubit.get(context).controller.animateToPage(entry.key),
          child: Container(
            width: responsiveWidth(context) / 43,
            height: responsiveHeight(context) / 45,
            margin: EdgeInsets.only(
                top: responsiveHeight(context) / 100,
                left: responsiveWidth(context) / 100,
                right: responsiveWidth(context) / 100),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(AppCubit.get(context).current == entry.key
                        ? 0.9
                        : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}

PreferredSizeWidget myAppbar(
  context, {
  required String title,
  required bool isBack,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0,
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: (Colors.white)),
    backgroundColor: Colors.white,
    centerTitle: isBack ? false : true,
    actions: actions,
    leading: isBack
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: AppColors.black,
            ))
        : const SizedBox(),
    title: Text(
      title,
      style: AppTextStyle.appBar,
    ),
  );
}

// ignore: must_be_immutable
class ButtomSheetForm extends StatelessWidget {
  final String title;
  final String hint;
  double? fontSize;

  ButtomSheetForm(
      {super.key, required this.title, required this.hint, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.appBar.copyWith(fontSize: fontSize),
        ),
        SizedBox(
          height: responsiveHeight(context) / 70,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey.withOpacity(.5))),
          ),
        )
      ],
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

void showSnackBar(BuildContext context, String message, Color color) {
  String messages = message;
  Color? color;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(messages),
    ),
  );
}

Future myBottomSheet(
  context, {
  required Widget child,
  bool? isControlled,
}) {
  return showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: isControlled ?? false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: child,
          ),
        );
      });
}
