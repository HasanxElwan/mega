import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/features/Home/product/reviews_screen.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel model;
  const ProductDetailsScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: myAppbar(context, title: model.name, isBack: true),
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
                  cubit.addtoCart(model.inCart, model).then((value) {
                    cubit.getFinalPrice(model);
                  });
                },
                label: Text(
                  'Add To Cart',
                  style: AppTextStyle.buttonText,
                )),
          ),
          body: FadeInUp(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context) / 40,
                  vertical: responsiveHeight(context) / 80),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: cubit.controller,
                      items: model.imageList
                          .map((e) => Container(
                              width: responsiveWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ImageWithFadeIn(image: e)))
                          .toList(),
                      options: CarouselOptions(
                          autoPlayInterval: const Duration(seconds: 4),
                          height: MediaQuery.of(context).size.height / 5,
                          autoPlay: true,
                          autoPlayCurve: Curves.bounceOut,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            cubit.changeIndicator(index);
                          }),
                    ),
                    CarousalDots(modelList: model.imageList),
                    SizedBox(
                      height: responsiveHeight(context) / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context) / 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: responsiveWidth(context) / 1.3,
                                child: Text(
                                  model.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.appBar,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit.changeFavourite(
                                        model.isFavourite, model);
                                  },
                                  icon: model.isFavourite
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Color(0xffFB7181),
                                          size: 35,
                                        )
                                      : Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.grey,
                                          size: 35,
                                        )),
                            ],
                          ),
                          RateComponent(
                              rate: model.rate.toDouble(),
                              size: responsiveHeight(context) / 32),
                          SizedBox(
                            height: responsiveHeight(context) / 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: responsiveWidth(context) / 80),
                            child: Row(
                              children: [
                                Text(
                                  r'$' '${model.price}',
                                  style: AppTextStyle.appBar,
                                ),
                                const Spacer(),
                                Row(
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: responsiveHeight(context) / 50,
                          ),
                          Text(
                            'Details',
                            style: AppTextStyle.sideTitle.copyWith(shadows: []),
                          ),
                          SizedBox(
                            height: responsiveHeight(context) / 80,
                          ),
                          Text(
                            model.details,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.details,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Review Product',
                                style: AppTextStyle.appBar,
                              ),
                              TextButton(
                                onPressed: () {
                                  navigatTo(context,
                                      screen: BlocProvider.value(
                                          value: AppCubit.get(context),
                                          child: ReviewsScreen(
                                              model: model.review)));
                                },
                                child: Text(
                                  'See more >',
                                  style: AppTextStyle.greyBold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              RateComponent(
                                  rate: model.rate.toDouble(),
                                  size: responsiveHeight(context) / 32),
                              SizedBox(
                                width: responsiveWidth(context) / 50,
                              ),
                              Text(
                                '${model.rate}',
                                style: AppTextStyle.discount.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                width: responsiveWidth(context) / 90,
                              ),
                              Text(
                                '(${model.review.length} review)',
                                style: AppTextStyle.discount.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: responsiveHeight(context) / 80,
                          ),
                          ReviewComponent(review: model.review[0]),
                          SizedBox(
                            height: responsiveHeight(context) / 50,
                          ),
                          Text('You Might Also Like',
                              style: AppTextStyle.sideTitle.copyWith(
                                shadows: [],
                                color: AppColors.black,
                              )),
                          SizedBox(
                            height: responsiveHeight(context) / 80,
                          ),
                          SizedBox(
                            height: responsiveHeight(context) / 3,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ProductComponent(
                                  model: cubit.products[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: responsiveWidth(context) / 50,
                                );
                              },
                              itemCount: cubit.products.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 12,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
