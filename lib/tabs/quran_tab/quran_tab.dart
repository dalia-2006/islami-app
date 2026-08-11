import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_details.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/widget/sura_list_row.dart';

import '../../utils/size_utils.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    int index = 0;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.04,
          horizontal: context.width * 0.04,
        ),
        child: Column(
          spacing: height * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              cursorColor: AppColors.primaryColor,
              style: AppStyles.bold16white,
              decoration: InputDecoration(
                enabledBorder: builtTextField(),
                focusedBorder: builtTextField(),
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.searchIcon),
                  color: AppColors.primaryColor,
                ),
                hintText: 'Sura Name',
                hintStyle: AppStyles.bold16white,
              ),
            ),
            Text('Most Recently', style: AppStyles.bold16white),
            SizedBox(
              height: height * 0.2,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Al-Anbiya", style: AppStyles.bold24black),
                            Text("الأنبياء", style: AppStyles.bold24black),
                            Text("112 Verses", style: AppStyles.bold14black),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecently),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.004);
                },
                itemCount: 10,
              ),
            ),
            Text('Sura List', style: AppStyles.bold16white),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: navigate to sura details screen
                    Navigator.pushNamed(
                      context,
                      AppRoutes.suraDetailsRouteName,
                      arguments: index,
                    );
                    setState(() {});
                  },
                  child: SuraListRow(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.04);
              },
              itemCount: SuraDetails.suraNameAr.length,
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder builtTextField() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }
}
