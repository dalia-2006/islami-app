import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double turns = 0.0;

  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  void onSebhaTap() {
    setState(() {
      turns += 1 / 33;
      counter++;
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.04,
        horizontal: context.width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.aya),
          // const SizedBox(height: 16),
          Expanded(
            child: GestureDetector(
              onTap: onSebhaTap,
              child: SizedBox(
                height: context.height * 0.45,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -6,
                      child: Image.asset(
                        AppAssets.sebhaHead,
                        height: context.height * 0.1,
                      ),
                    ),

                    Positioned(
                      top: context.height * 0.08,
                      child: AnimatedRotation(
                        turns: turns,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        child: Image.asset(
                          AppAssets.sebhaBody,
                          height: context.height * 0.4,
                        ),
                      ),
                    ),

                    Positioned(
                      top: context.height * 0.24,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            azkar[index],
                            style: AppStyles.bold36white,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '$counter',
                            style: AppStyles.bold36white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}