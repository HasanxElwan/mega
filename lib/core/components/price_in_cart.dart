import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/core/components/shared_component.dart';

import '../../bloc/App/app_cubit.dart';
import '../../bloc/App/app_states.dart';
import '../resources/colors_manager.dart';
import '../resources/textstyle_manager.dart';
import '../utils/helper_functions.dart';
import '../utils/responsive.dart';

// ignore: must_be_immutable
class PriceInCart extends StatelessWidget {
  dynamic itemsPrice;
  final double shippingPrice;
  final double importChargesPrice;
  dynamic totalPrice;
  final int numOfItems;

  PriceInCart(
      {super.key,
      required this.itemsPrice,
      required this.shippingPrice,
      required this.importChargesPrice,
      required this.numOfItems,
      required this.totalPrice});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, stste) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context) / 100,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey.withOpacity(.5))),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context) / 60,
                vertical: responsiveHeight(context) / 70),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Items ($numOfItems)',
                      style: AppTextStyle.greyBold
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      r'$' '$itemsPrice',
                      style: AppTextStyle.appBar
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 80,
                ),
                Row(
                  children: [
                    Text(
                      'Shipping',
                      style: AppTextStyle.greyBold
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      r'$' '$shippingPrice',
                      style: AppTextStyle.appBar
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 80,
                ),
                Row(
                  children: [
                    Text(
                      'Import charges',
                      style: AppTextStyle.greyBold
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      r'$' '$importChargesPrice',
                      style: AppTextStyle.appBar
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context) / 20),
                  child: const MyDashedSeparator(height: .5),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 80,
                ),
                Row(
                  children: [
                    Text(
                      'Total Price',
                      style: AppTextStyle.appBar.copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    Text(
                      r'$' '$totalPrice',
                      style: AppTextStyle.appBar
                          .copyWith(fontSize: 17, color: HexColor('#40BFFF')),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
