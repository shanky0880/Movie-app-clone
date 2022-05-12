import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_ui/Componets/custom_outline.dart';
import 'package:netflix_ui/Constants.dart';
import 'package:netflix_ui/core/routes/routes.gr.dart';

class OnboadingPage extends HookConsumerWidget {
  const OnboadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(children: [
          Positioned(
              top: screenHeight * 0.1,
              left: -86,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
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
              )),
          Positioned(
            top: screenHeight * 0.3,
            right: -100,
            child: Container(
              height: 166,
              width: 166,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kGreenColor,
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),

                  CustomOutline(
                    strokeWidth: 4,
                    radius: screenWidth * 0.8,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kPinkColor.withOpacity(0),
                          Constants.kGreenColor.withOpacity(0.1),
                          Constants.kGreenColor,
                        ],
                        stops: const [
                          0.2,
                          0.4,
                          0.6,
                          1,
                        ]),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/vrbanner.png',
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    width: screenWidth * 0.8,
                    height: screenWidth * 0.8,
                    padding: const EdgeInsets.all(4),
                  ),
                  SizedBox(
                    height: screenHeight * 0.09,
                  ),
                  Text(
                    'Watch movies in \n Virtual Really',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 34,
                      color: Constants.kWhiteColor.withOpacity(0.85),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    'Download and watch offline \n wherever you are',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Constants.kWhiteColor.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(
                    height: screenHeight * 0.03,
                  ),

                  //button

                  CustomOutline(
                    strokeWidth: 3,
                    radius: 20,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kPinkColor.withOpacity(0.5),
                        Constants.kGreenColor.withOpacity(0.5),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).push(
                          const HomeRoute(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Constants.kPinkColor.withOpacity(0.5),
                              Constants.kGreenColor.withOpacity(0.5),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Constants.kWhiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                      ),
                    ),
                    width: 160,
                    height: 38,
                    padding: const EdgeInsets.all(3),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
