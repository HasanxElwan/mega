import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega/features/Home/cart/ship_to_screen.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/cart_item.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/price_in_cart.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/responsive.dart';

class YourCartScreen extends StatelessWidget {
  const YourCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: 'Your Cart', isBack: true),
          body: cubit.inCartList.isEmpty
              ? Container()
              : FadeInRight(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context) / 50,
                          vertical: responsiveHeight(context) / 50),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: responsiveHeight(context) / 2.5,
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CartItem(
                                        model: cubit.inCartList[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: responsiveHeight(context) / 90);
                                  },
                                  itemCount: cubit.inCartList.length),
                            ),
                            SizedBox(
                              height: responsiveHeight(context) / 40,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColors.grey.withOpacity(.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColors.grey.withOpacity(.5)),
                                  ),
                                  hintText: 'Enter Cupone code',
                                  suffixIcon: SizedBox(
                                    width: responsiveWidth(context) / 4,
                                    child: MaterialButton(
                                      height: responsiveHeight(context) / 12,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Apply',
                                        style: AppTextStyle.buttonText
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: responsiveHeight(context) / 60,
                            ),
                            PriceInCart(
                                itemsPrice: cubit.finalPrice,
                                shippingPrice: 40,
                                importChargesPrice: 128,
                                numOfItems: cubit.inCartList.length,
                                totalPrice: cubit.finalPrice + 90),
                            SizedBox(
                              height: responsiveHeight(context) / 50,
                            ),
                            DefaultButton(
                                height: responsiveHeight(context) / 12,
                                color: AppColors.brown,
                                child: Text(
                                  'Check out',
                                  style: AppTextStyle.buttonText,
                                ),
                                onPressed: () {
                                  navigatTo(context,
                                      screen: BlocProvider.value(
                                          value: AppCubit.get(context),
                                          child: const ShipToScreen()));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
