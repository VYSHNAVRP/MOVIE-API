import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/Reprocitry/Model%20class/movie%20file.dart';

class Screen1 extends StatefulWidget {
  final String image;
  final String text;
  final List<String> view;
  final String Discription;

  const Screen1({super.key, required this.image, required this.text, required this.view, required this.Discription});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity.w,
              height: 250.h,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   widget.text,
                    style: GoogleFonts.merriweather(
                        fontSize: 17.sp, fontWeight: FontWeight.w400),
                  ),
                  Icon(Icons.bookmark_outline),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    "9.1/10 IMDB",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: SizedBox(
                height: 20.h,
                width: 220.w,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 20.h,
                      width: 61.w,
                      decoration: ShapeDecoration(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.view[index].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.sp),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 5.w,
                    );
                  },
                  itemCount: widget.view.length,
                ),
              ),
            ),
            SizedBox(height: 20.w),
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: Row(
                children: [
                  Text(
                    "Length",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: 70.w),
                  Text(
                    "Langauge",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: 70.w),
                  Text(
                    "Rating",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Text(
                    "2H 28Min",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 70.w),
                  Text(
                    "ENGLISH",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 70.w),
                  Text(
                    "PG-13",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Discription",
                style: GoogleFonts.merriweather(
                    fontWeight: FontWeight.w500, fontSize: 20.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                widget.Discription,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  Text(
                    "CAST",
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.w500, fontSize: 18.sp),
                  ),
                  SizedBox(width: 160.h),
                  Container(
                    height: 20.h,
                    width: 60.w,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(360.r),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "See more",
                        style: TextStyle(
                            fontSize: 11.sp, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding:  EdgeInsets.only(left: 7.5.w),
              child: Row(
                children: [
                  Container(
                    height: 90.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Image.asset("assets/peter.png",fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    height: 90.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Image.asset("assets/cheet.png",fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    height: 90.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Image.asset("assets/strange.png",fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
                  Container(
                    height: 90.h,
                    width: 85.w,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Image.asset("assets/friend.png",fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 3.w,),
        
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
