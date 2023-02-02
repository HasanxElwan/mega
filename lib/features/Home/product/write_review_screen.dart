import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/responsive.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: myAppbar(context, title: 'Write Review', isBack: true),
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
                onPressed: () {},
                label: Text(
                  'Send Review',
                  style: AppTextStyle.buttonText,
                )),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context) / 30,
                vertical: responsiveHeight(context) / 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: responsiveWidth(context) / 50),
                    child: Text(
                      'Please write Overall level of satisfaction with your shipping / Delivery Service',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.appBar.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(context) / 40,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        updateOnDrag: true,
                        itemCount: 5,
                        glow: false,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          //  print(rating);
                          cubit.changeRate(rating);
                        },
                      ),
                      SizedBox(
                        width: responsiveWidth(context) / 50,
                      ),
                      Text(
                        '${cubit.currenRate}/5',
                        style: AppTextStyle.discount.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: responsiveHeight(context) / 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context) / 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Write Your Review',
                          style: AppTextStyle.appBar,
                        ),
                        SizedBox(
                          height: responsiveHeight(context) / 80,
                        ),
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                              hintText: 'Write Your Review here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: AppColors.grey.withOpacity(.3)))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
