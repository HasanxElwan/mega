import 'package:flutter/material.dart';

import '../../../../core/components/order_item.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/utils/responsive.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: 'My Orders', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context) / 50,
            vertical: responsiveHeight(context) / 40),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MyOrder(
                  title: 'XXXXX',
                  decription: 'XXXXX : 12 Oct 2022',
                  orderStatus: 'Shipping',
                  numOfitems: 2,
                  price: 2200),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
