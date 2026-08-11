import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../utils/size_utils.dart';

class SuraItemWidget extends StatelessWidget {
  final String content;

  final int index;

  const SuraItemWidget({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Text(
        '$content [${index + 1}]',
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
