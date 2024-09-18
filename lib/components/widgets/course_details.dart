// Reusable Course Details Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/components/constants/app_color.dart';
import 'package:online_course/components/widgets/card_info.dart';

class CourseDetails extends StatelessWidget {
  final String courseName;
  final String description;
  final int lessons;
  final String totalTime;

  const CourseDetails({
    required this.courseName,
    required this.description,
    required this.lessons,
    required this.totalTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Our Student",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  studentProfile(profileImage: "assets/images/person1.jpg"),
                  studentProfile(profileImage: "assets/images/person2.jpg"),
                  studentProfile(profileImage: "assets/images/person3.jpeg"),
                  studentProfile(profileImage: "assets/images/girl.jpg"),
                  studentProfile(profileImage: "assets/images/person1.jpg"),



                ],
              ),
              SizedBox(height: 12.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  courseName,
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description,style: TextStyle(
                  color: AppColors.textSecondaryColor,
                  fontSize: 14.sp,

                ),
                  maxLines: 3,

                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            style:  TextStyle(fontSize: 12.sp, color: Colors.grey,fontWeight: FontWeight.bold),
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
                            child: Icon(Icons.watch_later_outlined,size: 18,color: Colors.grey.shade400,),
                          ),
                          Text(
                            '13h 30min',
                            style:  TextStyle(fontSize: 12.sp, color: Colors.grey,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding studentProfile({required String  profileImage}) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              width: 30.w,  // Size of the CircleAvatar
              height: 30.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color for elevation
                    spreadRadius: 1,  // Spread radius
                    blurRadius: 5,   // Blur radius
                    offset: const Offset(0, 5),  // Offset for shadow
                  ),
                ],
                image:  DecorationImage(
                  image: AssetImage(profileImage), // Replace with your local asset
                  fit: BoxFit.cover,  // Ensure the image fits the circle properly
                ),
              ),
            ),
          );
  }
}
