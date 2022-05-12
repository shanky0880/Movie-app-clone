import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_ui/Constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Constants.kGreyColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            Constants.kIconSearch,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Constants.kWhiteColor.withOpacity(0.6),
                fontSize: 17,
                letterSpacing: -0.41,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            Constants.kIconMic,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
