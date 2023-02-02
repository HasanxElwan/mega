import 'package:flutter/material.dart';

import '../../features/Home/profile/order_details_screen.dart';
import '../resources/colors_manager.dart';
import '../resources/textstyle_manager.dart';
import '../utils/helper_functions.dart';
import '../utils/responsive.dart';

class MyOrder extends StatelessWidget {
  final String title;
  final String decription;
  final String orderStatus;
  final int numOfitems;
  final double price;

  const MyOrder(
      {super.key,
      required this.title,
      required this.decription,
      required this.orderStatus,
      required this.numOfitems,
      required this.price});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatTo(context, screen: const OrderDetailsScreen());
      },
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(width: 1, color: AppColors.grey.withOpacity(.5))),
        child: Padding(
          padding: EdgeInsets.only(
              right: responsiveWidth(context) / 50,
              left: responsiveWidth(context) / 50,
              top: responsiveHeight(context) / 60),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.appBar.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 50,
                ),
                Text(
                  decription,
                  style: AppTextStyle.details,
                ),
                SizedBox(
                  height: responsiveHeight(context) / 30,
                ),
                Row(
                  children: [
                    Text(
                      'order status',
                      style: AppTextStyle.details,
                    ),
                    const Spacer(),
                    Text(
                      orderStatus,
                      style: AppTextStyle.details,
                    ),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 100,
                ),
                Row(
                  children: [
                    Text(
                      'Items',
                      style: AppTextStyle.details,
                    ),
                    const Spacer(),
                    Text(
                      '$numOfitems items Purchase',
                      style: AppTextStyle.details,
                    ),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 100,
                ),
                Row(
                  children: [
                    Text(
                      'Price',
                      style: AppTextStyle.details,
                    ),
                    const Spacer(),
                    Text(
                      r'$' '$price',
                      style: AppTextStyle.details.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context) / 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
