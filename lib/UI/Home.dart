import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/Bloc/movie_bloc.dart';
import 'package:untitled7/Reprocitry/Model%20class/movie%20file.dart';
import 'package:untitled7/UI/Screen1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late MovieModel movie;

  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(fetchMovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 10.w),
              child: Row(
                children: [
                  Icon(Icons.menu),
                  SizedBox(width: 100.w),
                  Text(
                    "Filimku",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 105.w,
                  ),
                  Icon(Icons.notifications),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  Text(
                    "NOW SHOWING",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
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
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.all(15.w),
              child: SizedBox(
                height: 283.h,
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is Movieloading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is Movieerror) {
                      return RefreshIndicator(
                        child: Text("Error"),
                        onRefresh: () async {
                          return BlocProvider.of<MovieBloc>(context)
                              .add(fetchMovie());
                        },
                      );
                    }
                    if (state is Movieloaded) {
                      movie = BlocProvider.of<MovieBloc>(context).movieModel;

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 11.w,
                          );
                        },
                        itemCount: movie.movies!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Screen1(
                                        image: movie.movies![index].backdropPath
                                            .toString(),
                                        text: movie.movies![index].originalTitle
                                            .toString(),
                                        view: movie.movies![index].genres!,
                                        Discription: movie
                                            .movies![index].overview
                                            .toString(),
                                      )));
                            },
                            child: Container(
                              width: 152.w,
                              height: 275.h,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    height: 212.h,
                                    width: 143.w,
                                    child: Image.network(
                                      movie.movies![index].backdropPath
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    movie.movies![index].originalTitle
                                        .toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Text(
                                        "9.1/10 IMDB",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  Text(
                    "POPULAR",
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.w500, fontSize: 18.sp),
                  ),
                  SizedBox(width: 140.h),
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
            SizedBox(height: 12.h),
            SizedBox(
                width: 327.w,
                height: 292.h,
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is Movieloading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is Movieerror) {
                      return RefreshIndicator(
                          child: Text("ERROR"),
                          onRefresh: () async {
                            return BlocProvider.of<MovieBloc>(context)
                                .add(fetchMovie());
                          });
                    }
                    if (state is Movieloaded) {
                      movie = BlocProvider.of<MovieBloc>(context).movieModel;
                      return ListView.separated(
                        itemCount: movie.movies!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Screen1(
                                      image: movie.movies![index].backdropPath
                                          .toString(),
                                      text: movie.movies![index].originalTitle
                                          .toString(),
                                      view: movie.movies![index].genres!,
                                      Discription: movie.movies![index].overview
                                          .toString())));
                            },
                            child: Container(
                              width: 304.w,
                              height: 120.h,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    height: 200.h,
                                    width: 100.w,
                                    child: Image.network(
                                      movie.movies![index].backdropPath
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                        width: 150.w,
                                        child: Text(
                                          movie.movies![index].originalTitle
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      SizedBox(height: 7.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text("6.5/10 IMDB"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                        width: 200.w,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, position) {
                                            return Container(
                                              height: 20.h,
                                              width: 61.w,
                                              decoration: ShapeDecoration(
                                                color: Colors.blueGrey,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          360.r),
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                movie.movies![index]
                                                    .genres![position]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12.sp),
                                              )),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SizedBox(
                                              width: 5.w,
                                            );
                                          },
                                          itemCount: movie
                                              .movies![index].genres!.length,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          Text("1h 47m"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 12.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
