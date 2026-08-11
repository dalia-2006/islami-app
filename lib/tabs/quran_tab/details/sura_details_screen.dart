import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_details.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/widget/sura_item_widget.dart';

import '../../../utils/size_utils.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
          centerTitle: true,
          title: Text(
            SuraDetails.suraNameEn[index],
            style: AppStyles.bold20primary,
          ),
        ),
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.01,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.suraLeftDecoration),
                  Text(
                    SuraDetails.suraNameAr[index],
                    style: AppStyles.bold24primary,
                  ),
                  Image.asset(AppAssets.suraRightDecoration),
                ],
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraItemWidget(
                            content: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox();
                        },
                        itemCount: verses.length,
                      ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppAssets.suraBottomDecoration,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: height * 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
