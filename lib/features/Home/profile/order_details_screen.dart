import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';
import '../../../../core/components/product_in_order.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/responsive.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: 'Order Details', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context) / 50,
            vertical: responsiveHeight(context) / 40),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DefaultStepper(),
              SizedBox(
                height: responsiveHeight(context) / 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context) / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product',
                      style: AppTextStyle.appBar,
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 60,
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 3,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const ProductInOrder();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: responsiveHeight(context) / 50,
                            );
                          },
                          itemCount: 3),
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 80,
                    ),
                    Text(
                      'Shipping Details',
                      style: AppTextStyle.appBar,
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 60,
                    ),
                    Container(
                      height: responsiveHeight(context) / 4.8,
                      width: responsiveWidth(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grey.withOpacity(.5))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: responsiveWidth(context) / 50,
                            right: responsiveWidth(context) / 50,
                            top: responsiveHeight(context) / 80),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              rowItem(context,
                                  title: 'Date Shipping',
                                  text: 'January 1, 2023'),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              rowItem(context,
                                  title: 'Shipping', text: 'xxxxx'),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              rowItem(context,
                                  title: 'xxxxxx', text: '0106033656'),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              rowItem(context,
                                  title: 'Address', text: 'XXXXXXXXXXXX'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 40,
                    ),
                    Text(
                      'Payment Details',
                      style: AppTextStyle.appBar,
                    ),
                    SizedBox(
                      height: responsiveHeight(context) / 60,
                    ),
                    Container(
                      height: responsiveHeight(context) / 4.8,
                      width: responsiveWidth(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grey.withOpacity(.5))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: responsiveWidth(context) / 50,
                            right: responsiveWidth(context) / 50,
                            top: responsiveHeight(context) / 80),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              rowPaymentItem(context,
                                  title: 'Items (2)', text: r'$19606.86'),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              rowPaymentItem(context,
                                  title: 'Shipping', text: r'$40.00'),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              rowPaymentItem(context,
                                  title: 'Import charges', text: r'$128.00'),
                              SizedBox(
                                height: responsiveHeight(context) / 50,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: responsiveWidth(context) / 2,
                                    child: Text(
                                      'Total Price',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.details.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    r'$20088.2',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.details.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget rowItem(context, {required String title, required String text}) {
  return Row(
    children: [
      SizedBox(
        width: responsiveWidth(context) / 2,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details,
        ),
      ),
      const Spacer(),
      SizedBox(
        width: responsiveWidth(context) / 2.95,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details.copyWith(color: AppColors.black),
        ),
      ),
    ],
  );
}

Widget rowPaymentItem(context, {required String title, required String text}) {
  return Row(
    children: [
      SizedBox(
        width: responsiveWidth(context) / 2,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details,
        ),
      ),
      const Spacer(),
      Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.details.copyWith(color: AppColors.black),
      ),
    ],
  );
}
