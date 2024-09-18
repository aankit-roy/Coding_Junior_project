import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/components/constants/app_color.dart';
import 'package:online_course/components/widgets/card_info.dart';
import 'package:online_course/components/widgets/course_card.dart';
import 'package:online_course/components/widgets/section_holder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size siz = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              headerContainer(),
              const SizedBox(height: 24),
              // Current Course Card
              summaryCard(),
              SizedBox(height: 10.h),
              const SectionHeader(title: 'Popular Course'),
              SizedBox(height: 10.h),
              SizedBox(
                height: siz.height * .25.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: const [
                    CourseCard(
                      courseIconPath: "assets/icons/pa.png",
                      courseName: 'Photoshop Editing Course',
                      participants: 20,
                      rating: 4.8,
                      lessons: 30,

                    ),
                    CourseCard(
                      courseIconPath: "assets/icons/ia.png",
                      courseName: 'Photoshop Editing Course',
                      participants: 20,
                      rating: 4.8,
                      lessons: 30,

                    ),
                    CourseCard(
                      courseIconPath: "assets/icons/pa.png",
                      courseName: 'Photoshop Editing Course',
                      participants: 20,
                      rating: 4.8,
                      lessons: 30,

                    ),
                    CourseCard(
                      courseIconPath: "assets/icons/pr.png",
                      courseName: 'Photoshop Editing Course',
                      participants: 20,
                      rating: 4.8,
                      lessons: 30,

                    ),
                    CourseCard(
                      courseIconPath: "assets/icons/ae.png",
                      courseName: 'Photoshop Editing Course',
                      participants: 20,
                      rating: 4.8,
                      lessons: 30,

                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              // Another Popular Course Section
              const SectionHeader(title: 'Popular Course'),
                SizedBox(height: 10.h),
             bottomPopularCourse()
            ],
          ),
        ),
      ),
    );
  }
  Container headerContainer() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Container(
              width: 60.w,  // Size of the CircleAvatar
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color for elevation
                    spreadRadius: 2,  // Spread radius
                    blurRadius: 10,   // Blur radius
                    offset: const Offset(0, 5),  // Offset for shadow
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/girl.jpg'), // Replace with your local asset
                  fit: BoxFit.cover,  // Ensure the image fits the circle properly
                ),
              ),
            ),
          ),


          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Christiana Amandla',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lets Learning to smart',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ]),
                child: const Icon(Icons.search)),
          )
        ],
      ),
    );
  }


  Container summaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.secondaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mathematics Course',
                    style:
                        TextStyle(fontSize: 18.sp, color: AppColors.blackColor),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.primaryColor),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text(
                              '19 Nov, 2023',
                              style:
                                  TextStyle(color: AppColors.textPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const InfoCard(
                  title: "Completed", data: 20, icon: Icons.check_circle),
              // Adjusted Vertical Divider
              Container(
                height: 60
                    .h, // Set the height of the divider to match other content
                child: VerticalDivider(
                  color: AppColors.secondaryColor,
                  thickness: 2.5, // Thickness of the divider line
                  width: 20, // Width (including padding)
                ),
              ),
              const InfoCard(
                title: "Hours Spent",
                data: 455,
                icon: Icons.watch_later,
              )
            ],
          ),
        ],
      ),
    );
  }
  Container bottomPopularCourse() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 75.w,
              height: 75.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.backgroundColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/icons/xd.png"),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adobe Xd Editing Course",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(Icons.star, color: Colors.orange, size: 16),
                            ),
                            Text(
                              4.8.toString(),
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(Icons.play_circle_outline_rounded,size: 18,color: Colors.grey.shade400,),
                            ),
                            Text(
                              '30 Lessons',
                              style:  TextStyle(fontSize: 12.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }


}




