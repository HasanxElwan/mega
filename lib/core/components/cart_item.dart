import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/core/components/shared_component.dart';

import '../../bloc/App/app_cubit.dart';
import '../../bloc/App/app_states.dart';
import '../../models/product_model.dart';
import '../resources/textstyle_manager.dart';
import '../resources/colors_manager.dart';
import '../utils/helper_functions.dart';
import '../utils/responsive.dart';

class CartItem extends StatelessWidget {
  final ProductModel model;
  const CartItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: responsiveHeight(context) / 6,
          width: responsiveWidth(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey.withOpacity(.5))),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: responsiveWidth(context) / 80),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: responsiveHeight(context) / 8,
                    width: responsiveWidth(context) / 3.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ImageWithFadeIn(image: model.image),
                  ),
                  SizedBox(
                    width: responsiveWidth(context) / 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: responsiveWidth(context) / 2.2,
                            child: Text(
                              model.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.appBar.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: responsiveWidth(context) / 50,
                          ),
                          InkWell(
                            onTap: () {
                              AppCubit.get(context)
                                  .changeFavourite(model.isFavourite, model);
                            },
                            child: model.isFavourite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Color(0xffFB7181),
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                          ),
                          SizedBox(
                            width: responsiveWidth(context) / 80,
                          ),
                          InkWell(
                            onTap: () {
                              AppCubit.get(context)
                                  .removeFromCart(model.inCart, model);
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: responsiveHeight(context) / 40,
                      ),
                      Row(
                        children: [
                          Text(
                            r'$' '${model.price}',
                            style: AppTextStyle.appBar.copyWith(
                                fontSize: 15, color: HexColor('#40BFFF')),
                          ),
                          SizedBox(
                            width: responsiveWidth(context) / 3.8,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  AppCubit.get(context)
                                      .changequantity(false, model);
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 30,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: responsiveWidth(context) / 50),
                                height: responsiveHeight(context) / 30,
                                width: responsiveWidth(context) / 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.withOpacity(.5)),
                                child: Center(child: Text('${model.quantity}')),
                              ),
                              InkWell(
                                onTap: () {
                                  AppCubit.get(context)
                                      .changequantity(true, model);
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
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
