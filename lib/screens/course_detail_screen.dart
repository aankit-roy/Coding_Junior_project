import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/components/constants/app_color.dart';
import 'package:online_course/components/widgets/card_info.dart';
import 'package:online_course/components/widgets/course_details.dart';
import 'package:online_course/components/widgets/course_video_items.dart';
import 'package:online_course/components/widgets/section_holder.dart';
import 'package:online_course/screens/payment_successful_screen.dart';

class CourseDetailScreen extends StatefulWidget {
 final String courseName;
 final  String iconsPath;


  const CourseDetailScreen({super.key, required this.courseName, required this.iconsPath});


  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  // Define your video items in a list
  final List<Map<String, dynamic>> videoItems = [
    {
      'title': 'Introduction',
      'duration': '3h 30min',
      'isLocked': true,
    },
    {
      'title': 'Install Software',
      'duration': '1h 30min',
      'isLocked': false,
    },
    {
      'title': 'Learn Tools',
      'duration': '2h 30min',
      'isLocked': false,
    },
    {
      'title': 'Tracing Sketsa',
      'duration': '2h 30min',
      'isLocked': true,
    },
    {
      'title': 'Introduction',
      'duration': '3h 30min',
      'isLocked': true,
    },
    {
      'title': 'Install Software',
      'duration': '1h 30min',
      'isLocked': false,
    },
    {
      'title': 'Learn Tools',
      'duration': '2h 30min',
      'isLocked': false,
    },
    {
      'title': 'Tracing Sketsa',
      'duration': '2h 30min',
      'isLocked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBar(),
                  SizedBox(height: 16.h),
                  // Course Details Section
                  const CourseDetails(
                    courseName: 'Photoshop Editing Course',
                    description:
                    'A representation that can convey the three-dimensional aspect of a design through a two-dimensional medium.',
                    lessons: 30,
                    totalTime: '13h 30min',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SectionHeader(title: "Video"),
                  ),
                  // Video List Section using ListView.builder
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: videoItems.length,
                    itemBuilder: (context, index) {
                      final video = videoItems[index];
                      return CourseVideoItem(
                        title: video['title'],
                        duration: video['duration'],
                        isLocked: video['isLocked'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomNavBar(),
        ),
      ),
    );


  }

  Container bottomNavBar() {
    return Container(
          height: 80.h,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor,

                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.bookmarks_rounded,size: 22,color: AppColors.whiteColor,),
                    ),

                  ),
                ),
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return const PaymentSuccessfulScreen();
                     }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Enroll Now',
                        style: TextStyle(fontSize: 18.sp,color: AppColors.blackColor),
                      ),
                    ),
                  ),
                ),

              ],

            ),
          ),
        );
  }

  Container customAppBar() {
    return Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
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
                              child: const Icon(Icons.chevron_left_rounded)),
                        ),
                      ),
                      Text("Details",style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700
                      ),),
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
                            child: const Icon(Icons.notifications_none)),
                      )
                    ],
                  ),
                );
  }
}

