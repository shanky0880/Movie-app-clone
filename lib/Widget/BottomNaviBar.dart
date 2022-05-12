import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:netflix_ui/Constants.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: screenWidth,
      height: 55,
      borderRadius: 0,
      linearGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Constants.kWhiteColor.withOpacity(0.1),
          Constants.kWhiteColor.withOpacity(0.1),
        ],
      ),
      border: 0,
      blur: 20,
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Constants.kPinkColor,
          Constants.kGreenColor,
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.transparent,
        notchMargin: 8,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconHome,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconPlayOnTv,
                ),
              ),
            ),
            const Expanded(
              child: Text(''),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconCategories,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconDownload,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
