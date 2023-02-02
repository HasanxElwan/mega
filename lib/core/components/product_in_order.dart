import 'package:flutter/material.dart';
import 'package:mega/core/components/shared_component.dart';

import '../resources/colors_manager.dart';
import '../resources/textstyle_manager.dart';
import '../utils/responsive.dart';

class ProductInOrder extends StatelessWidget {
  const ProductInOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(context) / 6,
      width: responsiveWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .7, color: AppColors.grey.withOpacity(.5))),
      child: Row(
        children: [
          Container(
            height: responsiveHeight(context) / 7,
            width: responsiveWidth(context) / 4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAlias,
            child: const ImageWithFadeIn(
                image:
                    'https://m.media-amazon.com/images/I/81PXHmO+KeL._AC_SX569_.jpg'),
          ),
          SizedBox(
            width: responsiveWidth(context) / 50,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HP 255 G8 Laptop',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.appBar.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 20,
                ),
                Text(
                  r'$9777',
                  style: AppTextStyle.appBar.copyWith(fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
