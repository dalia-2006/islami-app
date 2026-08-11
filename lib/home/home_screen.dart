import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_app/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/tabs/time_tab/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_theme.dart';

import '../utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List<String> bgImg = [
    AppAssets.quranTabBg,
    AppAssets.hadithTabBg,
    AppAssets.sebhaTabBg,
    AppAssets.radioTabBg,
    AppAssets.timeTabBg,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              bgImg[selectedIndex],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                Image.asset(AppAssets.islamiLogo),
                Expanded(child: tabsList[selectedIndex]),
              ],
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              AppTheme.darkMode.bottomNavigationBarTheme.backgroundColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: [
            builtBottomNavigationBarItem(
              icon: AppAssets.quranIcon,
              label: 'Quran',
              index: 0,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.hadithIcon,
              label: 'Hadith',
              index: 1,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.sebhaIcon,
              label: 'Sebha',
              index: 2,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.radioIcon,
              label: 'Radio',
              index: 3,
            ),
            builtBottomNavigationBarItem(
              icon: AppAssets.timeIcon,
              label: 'Time',
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor,
              ),
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.04,
              ),
              child: ImageIcon(AssetImage(icon)),
            )
          : ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
