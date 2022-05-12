import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/Constants.dart';
import 'package:netflix_ui/MovieModel/MovieModel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ScreenPage extends StatelessWidget {
  final Movie mydata;
  const ScreenPage({
    Key? key,
    required this.mydata,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(mydata.moviePoster),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Container(
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
                      child: SvgPicture.asset(Constants.kIconPlay),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            mydata.movieName,
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: Constants.kWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            mydata.movieCategory,
            style: GoogleFonts.poppins(
              color: Constants.kWhiteColor,
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mydata.movieSinopsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: const Color.fromARGB(255, 211, 211, 211),
              ),
            ),
          ),
          RatingBarIndicator(
            rating: mydata.movieRating,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 17.0,
            direction: Axis.horizontal,
          ),
          // Text(mydata.movieDuration, style: GoogleFonts.poppins(color: Constraints,),
          // Text(mydata.movieRating, style: GoogleFonts.poppins(color: Constraints,),
          // Text(mydata.movieReleaseYear, style: GoogleFonts.poppins(color: Constraints,),
          // Text(mydata.movieSinopsis, style: GoogleFonts.poppins(color: Constraints,),
          // Text(mydata.movieCast.first, style: GoogleFonts.poppins(color: Constraints,),
          // Text(mydata.movieCast.last, style: GoogleFonts.poppins(color: Constraints,),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
