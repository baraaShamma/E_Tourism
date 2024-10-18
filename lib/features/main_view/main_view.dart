import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/app/app_preferences.dart';
import 'package:e_tourism/core/constant/assets.dart';
import 'package:e_tourism/core/constant/colors.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/add_for_admin/pages/add_for_admin_screen.dart';
import 'package:e_tourism/features/main_view/home/home_screen.dart';
import 'package:e_tourism/features/main_view/my_trips/presentation/pages/my_trips_screen.dart';
import 'package:e_tourism/features/main_view/profile/profile_screen.dart';
import 'package:e_tourism/features/main_view/widget/app_bar_with_logo.dart';
import 'package:e_tourism/features/search/presentation/widgets/search_options_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class MainView extends StatefulWidget {
  final String? index;

  MainView({super.key, this.index});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  AppPreferences appPreferences = instance<AppPreferences>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Widget> pages = [
    const HomeScreen(),
    MyTripsScreen(),
    ProfileScreen(),
  ];
  List<Widget> pagesAdmin = [
    const HomeScreen(),
    const AddForAdminScreen(),
    ProfileScreen(),
  ];
  List<Widget> unSelectedIcons = [
    SvgPicture.asset(
      Assets.iconsHomeOutline,
      width: AppSizeW.s16,
      height: AppSizeH.s16,
    ),
    SvgPicture.asset(
      Assets.iconsTripOutline,
      width: AppSizeW.s16,
      height: AppSizeH.s16,
    ),
    SvgPicture.asset(
      Assets.iconsProfileOutline,
      width: AppSizeW.s16,
      height: AppSizeH.s16,
    ),
  ];
  List<Widget> selectedIcons = [
    SvgPicture.asset(
      Assets.iconsHomeFilled,
      width: AppSizeW.s16,
      height: AppSizeH.s16,
    ),
    SvgPicture.asset(
      Assets.iconsTripFilled,
      width: AppSizeW.s16,
      height: AppSizeH.s16,
    ),
    SvgPicture.asset(
      Assets.iconsProfileFilled,
      width: AppSizeW.s16,
      height: AppSizeH.s16,
    ),
  ];
  List<String> titles = [
    "21",
    "22",
    "23",
  ];
  List<String> titlesAdmin = [
    "21",
    "المسؤول",
    "23",
  ];
  int currentIndex = 0;
  int lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppbarAppLogo(
          onPressedIcon: () async {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SearchOptionsDialog();
              },
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            appPreferences.getTypeUser() == 'admin'
                ? titlesAdmin[currentIndex].tr()
                : titles[currentIndex].tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: appPreferences.getTypeUser() == 'admin'
            ? pagesAdmin[currentIndex]
            : pages[currentIndex],
        extendBody: true,
        bottomNavigationBar: ShaderMask(
          shaderCallback: (Rect bounds) {
            return AppColor.bottomNavigationBar.createShader(bounds);
          },
          child: Container(
            height: AppSizeH.s56,
            margin: EdgeInsets.symmetric(
                horizontal: AppSizeW.s15, vertical: AppSizeH.s24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.r),
                border: Border.all(
                    color: Theme.of(context).colorScheme.outline, width: 1),
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                shape: BoxShape.rectangle),
            clipBehavior: Clip.none,
            child: BottomNavigationBar(
              selectedFontSize: 0,
              unselectedFontSize: 0,
              type: BottomNavigationBarType.shifting,
              elevation: 0.0,
              onTap: (value) {
                setState(() {
                  lastIndex = currentIndex;
                  currentIndex = value;
                });
              },
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: currentIndex,
              items: List.generate(
                  selectedIcons.length,
                  (index) => BottomNavigationBarItem(
                      icon: SizedBox(
                          child: FittedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            unSelectedIcons[index],
                          ],
                        ),
                      )),
                      tooltip:   appPreferences.getTypeUser() == 'admin'
                          ? titlesAdmin[index].tr()
                          : titles[index].tr(),
                      backgroundColor: Colors.transparent,
                      label: '',
                      activeIcon: SizedBox(
                          height: AppSizeH.s40,
                          child: FittedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: REdgeInsets.all(AppSizeW.s12),
                                  height: AppSizeH.s40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.50)),
                                  child: selectedIcons[index],
                                ),
                                SizedBox(
                                  width: AppSizeW.s4,
                                ),
                                Visibility(
                                    visible: currentIndex == index,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSizeW.s2),
                                      child: Text(
                                        appPreferences.getTypeUser() == 'admin'
                                            ? titlesAdmin[index].tr()
                                            : titles[index].tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                    ))
                              ],
                            ),
                          )))),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (currentIndex == 0) {
      return true;
    } else if (currentIndex != lastIndex) {
      currentIndex = lastIndex;
    } else if (currentIndex == lastIndex) {
      currentIndex = 0;
    }
    setState(() {});
    return false;
  }
}
