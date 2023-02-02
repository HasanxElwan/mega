// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mega/features/Home/product/write_review_screen.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../models/product_model.dart';

class ReviewsScreen extends StatelessWidget {
  List<Review> model;
  ReviewsScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            width: responsiveWidth(context) / 1.12,
            height: responsiveHeight(context) / 14,
            child: FloatingActionButton.extended(
                backgroundColor: AppColors.brown,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  navigatTo(context,
                      screen: BlocProvider.value(
                          value: AppCubit.get(context),
                          child: const WriteReviewScreen()));
                },
                label: Text(
                  'Write Review',
                  style: AppTextStyle.buttonText,
                )),
          ),
          backgroundColor: Colors.white,
          appBar:
              myAppbar(context, title: '${model.length} Review', isBack: true),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: responsiveHeight(context) / 1.1,
                  child: AnimationLimiter(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context) / 30,
                          vertical: responsiveHeight(context) / 50),
                      itemCount: model.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: responsiveHeight(context) / 70,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 600),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: ReviewComponent(review: model[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
