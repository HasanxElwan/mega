import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../bloc/App/app_cubit.dart';
import '../../bloc/App/app_states.dart';
import '../../../core/components/components.dart';
import '../../../core/components/shared_component.dart';
import '../../../core/utils/responsive.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: myAppbar(context, title: 'Favourite List', isBack: false),
            body: AnimationLimiter(
              child: cubit.favouriteList.isEmpty
                  ? Container()
                  : GridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context) / 50,
                          vertical: responsiveHeight(context) / 50),
                      crossAxisCount: 2,
                      physics: const BouncingScrollPhysics(),
                      mainAxisSpacing: responsiveHeight(context) / 50,
                      crossAxisSpacing: responsiveWidth(context) / 50,
                      childAspectRatio: .7,
                      children: List.generate(
                        cubit.favouriteList.length,
                        (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 400),
                            columnCount: 2,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                duration: const Duration(milliseconds: 800),
                                child: ProductComponent(
                                  model: cubit.favouriteList[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ));
      },
    );
  }
}
