import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.04,
            horizontal: context.width * 0.04,
          ),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkBrownColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          AppAssets.prayTime,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('16 Jul,\n2024', style: AppStyles.bold16white),
                          const Spacer(),
                          Text(
                            '09 Muh,\n1446',
                            style: AppStyles.bold16white,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Text('Pray Time', style: AppStyles.bold20brown),
                            Text('Tuesday', style: AppStyles.bold20black),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.03,
                                ),
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(AppAssets.prayBg),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('ASR', style: AppStyles.bold16white),
                                          Text('04:38', style: AppStyles.bold16white),
                                          Text('PM', style: AppStyles.bold16white),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: context.width * 0.03);
                                },
                                itemCount: 5,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Next Pray', style: AppStyles.bold16brown),
                                    Text(' - 02:32', style: AppStyles.bold16black),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isMuted = !isMuted;
                                        });
                                      },
                                      icon: ImageIcon(
                                        AssetImage(
                                          isMuted ? AppAssets.mute : AppAssets.sound,
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
                    ),
                  ],
                ),
              ),
              Text('Azkar', style: AppStyles.bold16white),
              Row(
                spacing: context.width*0.04,
                children: [
                  Container(
                    width:context.width*0.43 ,
                    height:context.height*0.23 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: BoxBorder.all(color: AppColors.primaryColor,width: 2),
                    ),
                    child: Image.asset(AppAssets.eveningAzkar,fit: BoxFit.fill,),
                  ),
                  Container(
                    width:context.width*0.43 ,
                    height:context.height*0.23 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: BoxBorder.all(color: AppColors.primaryColor,width: 2),
                    ),
                    child: Image.asset(AppAssets.morningAzkar,fit: BoxFit.fill,),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}