import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class CustomRadioContainer extends StatefulWidget {
  const CustomRadioContainer({super.key});

  @override
  State<CustomRadioContainer> createState() => _CustomRadioContainerState();
}

class _CustomRadioContainerState extends State<CustomRadioContainer> {
  bool isStopped = true;
  bool isSound = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                isStopped
                    ? AppAssets.suraBottomDecoration
                    : AppAssets.bottomDecoration2,
                color: AppColors.blackBgColor,
              ),
            ),
            Column(
              spacing: context.height * 0.03,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ibrahim Al-Akdar',
                  style: AppStyles.bold20black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isStopped = !isStopped;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage(
                          isStopped ? AppAssets.pause : AppAssets.resume,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isSound = !isSound;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage(
                          isSound ? AppAssets.sound : AppAssets.mute,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}