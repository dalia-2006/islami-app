import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/widget/custom_radio_container.dart';
import '../../utils/size_utils.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.04,
            horizontal: context.width * 0.02,
          ),
          child: Column(
            spacing: context.height * 0.01,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blackBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isRadioSelected ? AppColors.primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isRadioSelected = true;
                            });
                          },
                          child: Text(
                            'Radio',
                            style: isRadioSelected
                                ? AppStyles.bold16black
                                : AppStyles.bold16white,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isRadioSelected ? AppColors.primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isRadioSelected = false;
                            });
                          },
                          child: Text(
                            'Reciters',
                            style: !isRadioSelected
                                ? AppStyles.bold16black
                                : AppStyles.bold16white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomRadioContainer(),
              const CustomRadioContainer(),
              const CustomRadioContainer(),
              const CustomRadioContainer(),
              const CustomRadioContainer(),
            ],
          ),
        ),
      ),
    );
  }
}