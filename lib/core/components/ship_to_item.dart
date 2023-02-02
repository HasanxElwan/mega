import 'package:flutter/material.dart';

import '../../bloc/App/app_cubit.dart';
import '../../models/address_model.dart';
import '../resources/colors_manager.dart';
import '../resources/textstyle_manager.dart';
import '../utils/responsive.dart';
import 'components.dart';

class ShipToItem extends StatelessWidget {
  final AddressModel model;
  final VoidCallback onpressed;
  final int index;

  const ShipToItem(
      {super.key,
      required this.model,
      required this.onpressed,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Ink(
        padding: EdgeInsets.symmetric(
            vertical: responsiveHeight(context) / 50,
            horizontal: responsiveWidth(context) / 100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              width: AppCubit.get(context).currentShipToIndex == index ? 1 : .5,
              color: AppCubit.get(context).currentShipToIndex == index
                  ? AppColors.lightBlue
                  : AppColors.grey,
            )),
        child: Padding(
          padding: EdgeInsets.only(
            left: responsiveWidth(context) / 35,
            right: responsiveWidth(context) / 35,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: AppTextStyle.appBar.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 50,
                ),
                Text(
                  model.details,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.details.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 30,
                ),
                Text(
                  model.phone,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.details.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 50,
                ),
                Row(
                  children: [
                    DefaultButton(
                      onPressed: () {},
                      width: responsiveWidth(context) / 4,
                      color: AppColors.lightblack,
                      child: Text(
                        'Edit',
                        style: AppTextStyle.buttonText,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                          size: 35,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
