import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.navBarItems,
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.black,
              iconSize: 30,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeNavIndex(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
