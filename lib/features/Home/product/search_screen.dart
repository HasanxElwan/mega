import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/responsive.dart';
import '../Home Screens/home.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: 'Search Results', isBack: false),
          body: cubit.searchedProducts.isEmpty
              ? _notFoundSearchScreen(context)
              : _foundSearchScreen(context, cubit.searchedProducts),
        );
      },
    );
  }
}

Widget _notFoundSearchScreen(context) {
  return Padding(
    padding: EdgeInsets.only(
      top: responsiveHeight(context) / 10,
      left: responsiveWidth(context) / 40,
      right: responsiveWidth(context) / 40,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(ImageAssets.search),
          height: responsiveHeight(context) / 4,
          fit: BoxFit.cover,
        ),
        Text(
          'No Result Found',
          style: AppTextStyle.appBar.copyWith(fontSize: 22),
        ),
        SizedBox(
          height: responsiveHeight(context) / 40,
        ),
        DefaultButton(
          onPressed: () {
            navigatAndReplacement(context, screen: const HomeLayout());
          },
          color: AppColors.brown,
          child: Text(
            'Back to Home',
            style: AppTextStyle.buttonText,
          ),
        ),
      ],
    ),
  );
}

Widget _foundSearchScreen(context, List list) {
  return AnimationLimiter(
    child: GridView.count(
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context) / 50,
          vertical: responsiveHeight(context) / 50),
      crossAxisCount: 2,
      physics: const BouncingScrollPhysics(),
      mainAxisSpacing: responsiveHeight(context) / 50,
      crossAxisSpacing: responsiveWidth(context) / 50,
      childAspectRatio: .7,
      children: List.generate(
        list.length,
        (int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 400),
            columnCount: 2,
            child: SlideAnimation(
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 800),
                child: ProductComponent(
                  model: list[index],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
