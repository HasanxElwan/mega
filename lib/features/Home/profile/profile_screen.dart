import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/App/app_cubit.dart';
import '../../../bloc/App/app_states.dart';
import '../../../../core/components/components.dart';
import '../../../../core/components/shared_component.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/textstyle_manager.dart';
import '../../../../core/utils/responsive.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: 'Profile', isBack: true),
          body: Padding(
            padding: EdgeInsets.only(
                left: responsiveWidth(context) / 50,
                right: responsiveWidth(context) / 50,
                top: responsiveHeight(context) / 25),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    myBottomSheet(
                        isControlled: true,
                        context,
                        child: SizedBox(
                          height: responsiveHeight(context) / 2.2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsiveWidth(context) / 30,
                                vertical: responsiveHeight(context) / 60),
                            child: Column(
                              children: [
                                ButtomSheetForm(
                                    title: 'First Name',
                                    hint: 'enter your first name'),
                                SizedBox(
                                  height: responsiveHeight(context) / 50,
                                ),
                                ButtomSheetForm(
                                    title: 'Last Name',
                                    hint: 'Enter your last name'),
                                const Spacer(),
                                DefaultButton(
                                    color: AppColors.brown,
                                    onPressed: () {},
                                    child: Text(
                                      'Save',
                                      style: AppTextStyle.buttonText,
                                    ))
                              ],
                            ),
                          ),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context) / 50),
                    child: Row(
                      children: [
                        Container(
                          height: responsiveHeight(context) / 9.5,
                          width: responsiveWidth(context) / 4,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: const ImageWithFadeIn(
                              image:
                                  'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                        ),
                        SizedBox(
                          width: responsiveWidth(context) / 50,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hasan",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppTextStyle.profile.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: responsiveHeight(context) / 70,
                              ),
                              Text(
                                '@Hasan',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppTextStyle.details.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context) / 20,
                ),
                DefaultProfileTile(
                    title: 'Email',
                    icon: Icons.email_outlined,
                    onpressed: () {
                      myBottomSheet(
                          isControlled: true,
                          context,
                          child: SizedBox(
                            height: responsiveHeight(context) / 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context) / 30,
                                  vertical: responsiveHeight(context) / 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtomSheetForm(
                                      title: 'Change Emil',
                                      hint: 'enter your Updated email'),
                                  SizedBox(
                                    height: responsiveHeight(context) / 80,
                                  ),
                                  Text(
                                    'We Will Send verification to your New Email',
                                    style: AppTextStyle.details
                                        .copyWith(fontSize: 12),
                                  ),
                                  const Spacer(),
                                  DefaultButton(
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: AppTextStyle.buttonText,
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    trail: 'Hasan@gmail.com'),
                SizedBox(
                  height: responsiveHeight(context) / 70,
                ),
                DefaultProfileTile(
                    title: 'phone number',
                    icon: Icons.phone_android,
                    onpressed: () {
                      myBottomSheet(context,
                          isControlled: true,
                          child: SizedBox(
                            height: responsiveHeight(context) / 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context) / 30,
                                  vertical: responsiveHeight(context) / 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtomSheetForm(
                                      title: 'Phone Number',
                                      hint: 'enter your phone number'),
                                  SizedBox(
                                    height: responsiveHeight(context) / 80,
                                  ),
                                  const Spacer(),
                                  DefaultButton(
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: AppTextStyle.buttonText,
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    trail: '+201060336156'),
                SizedBox(
                  height: responsiveHeight(context) / 70,
                ),
                DefaultProfileTile(
                    title: 'Change password',
                    icon: Icons.lock_outline,
                    onpressed: () {
                      myBottomSheet(context,
                          isControlled: true,
                          child: SizedBox(
                            height: responsiveHeight(context) / 1.5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context) / 30,
                                  vertical: responsiveHeight(context) / 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtomSheetForm(
                                      title: 'Old Password',
                                      hint: 'enter your old password'),
                                  SizedBox(
                                    height: responsiveHeight(context) / 80,
                                  ),
                                  ButtomSheetForm(
                                      title: 'New Password',
                                      hint: 'enter your New password'),
                                  SizedBox(
                                    height: responsiveHeight(context) / 80,
                                  ),
                                  ButtomSheetForm(
                                      title: 'New Password again',
                                      hint: 'enter your new password'),
                                  SizedBox(
                                    height: responsiveHeight(context) / 80,
                                  ),
                                  const Spacer(),
                                  DefaultButton(
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: AppTextStyle.buttonText,
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    trail: ''),
                SizedBox(
                  height: responsiveHeight(context) / 70,
                ),
                DefaultProfileTile(
                    title: 'Change language',
                    icon: Icons.language_outlined,
                    onpressed: () {
                      myBottomSheet(context,
                          isControlled: true,
                          child: BlocProvider.value(
                            value: AppCubit.get(context),
                            child: BlocConsumer<AppCubit, AppStates>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                AppCubit cubit = AppCubit.get(context);
                                return SizedBox(
                                  height: responsiveHeight(context) / 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            responsiveWidth(context) / 30,
                                        vertical:
                                            responsiveHeight(context) / 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Choose Language',
                                          style: AppTextStyle.appBar,
                                        ),
                                        SizedBox(
                                          height:
                                              responsiveHeight(context) / 60,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              isExpanded: true,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: cubit.selectedlanguage,
                                              items: const [
                                                DropdownMenuItem(
                                                  value: 'English',
                                                  child: Text('English'),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'arabic',
                                                  child: Text('arabic'),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                cubit.chooseLang(value!);
                                              }),
                                        ),
                                        const Spacer(),
                                        DefaultButton(
                                            color: AppColors.brown,
                                            onPressed: () {},
                                            child: Text(
                                              'Save',
                                              style: AppTextStyle.buttonText,
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ));
                    },
                    trail: ''),
              ],
            ),
          ),
        );
      },
    );
  }
}
