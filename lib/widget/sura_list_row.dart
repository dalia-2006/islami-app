import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_details.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import '../utils/size_utils.dart';

class SuraListRow extends StatelessWidget {
  int index;

  SuraListRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Column(
      spacing: height * 0.02,
      children: [
        Row(
          spacing: 10,
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset(AppAssets.numVector),
                Text("${index + 1}", style: AppStyles.bold20white),
              ],
            ),
            Expanded(
              child: Column(
                spacing: height * 0.01,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SuraDetails.suraNameEn[index],
                    style: AppStyles.bold20white,
                  ),
                  Text(
                    "${SuraDetails.AyaNumber[index]} Verses",
                    style: AppStyles.bold14white,
                  ),
                ],
              ),
            ),
            Text(SuraDetails.suraNameAr[index], style: AppStyles.bold20white),
          ],
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.02,
          endIndent: width * 0.02,
          height: height * 0.04,
        ),
      ],
    );
  }
}
