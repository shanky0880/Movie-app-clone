import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_ui/Constants.dart';
import 'package:netflix_ui/MovieModel/MovieModel.dart';
import 'package:netflix_ui/Screen2.dart';
import 'package:netflix_ui/Widget/BottomNaviBar.dart';
import 'package:netflix_ui/Widget/MaskingImage.dart';
import 'package:netflix_ui/Widget/searchBar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Constants.kBlackColor,
        extendBody: true,
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreenColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.4,
                right: -80,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kPinkColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kCyanColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SafeArea(
                bottom: false,
                child: ListView(
                  primary: true,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'What would you \n like to see?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 28, color: Constants.kWhiteColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBar(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'New Movie',
                        style: GoogleFonts.poppins(
                          color: Constants.kWhiteColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          final mydata = newMovies[index];
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScreenPage(
                                        mydata: mydata,
                                      )));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20 : 0,
                              ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: mydata.moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Upcoming Movie',
                        style: GoogleFonts.poppins(
                          color: Constants.kWhiteColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          final mydata = upcomingMovies[index];
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }

                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20 : 0,
                              ),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: mydata.moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor.withOpacity(0.2),
                Constants.kGreenColor.withOpacity(0.2),
              ],
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Constants.kPinkColor,
                  Constants.kGreenColor,
                ],
              ),
            ),
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              fillColor: const Color(0xff404c57),
              child: SvgPicture.asset(Constants.kIconPlus),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNaviBar(screenWidth: screenWidth));
  }
}
