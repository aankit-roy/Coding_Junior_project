import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/screens/course_detail_screen.dart';

class CourseCard extends StatelessWidget {
  final String courseIconPath; // Changed to String to store the asset path
  final String courseName;
  final int participants;
  final double rating;
  final int lessons;
  // final List<String>
  //     participantImages; // List of participant image URLs or asset paths
  // final int additionalParticipants;

  const CourseCard({
    super.key,
    required this.courseIconPath, // Asset path for the icon
    required this.courseName,
    required this.participants,
    required this.rating,
    required this.lessons,
    // required this.participantImages,
    // required this.additionalParticipants,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // Navigate to the CourseDetailsScreen when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailScreen(
              courseName: courseName,
              iconsPath: courseIconPath,
            ),
          ),
        );
      },
      child: Container(
        width: size.width * .47.w,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Load the image from assets using Image.asset
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                courseIconPath, // Path to the asset icon
                width: 60.w,
                height: 60.h,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              courseName,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 20.h,
                    child: Stack(
                      children: [
                        // First participant
                        participantsProfile(leftShifting: 0,profileImg: "assets/images/person1.jpg"),

                        // Second participant (slightly overlapping)
                        participantsProfile(leftShifting: 14,profileImg: "assets/images/person2.jpg"),
                        participantsProfile(leftShifting: 28,profileImg: "assets/images/person3.jpeg"),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          'Participants',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                color: Colors.grey.shade200, // Set the color of the divider
                thickness: 2, // Set the thickness of the divider
                // Right padding
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.star, color: Colors.orange, size: 16),
                    ),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.play_circle_outline_rounded,
                        size: 18,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text(
                      '$lessons Lessons',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned participantsProfile({required String profileImg, required double leftShifting}) {
    return Positioned(
      left: leftShifting, // Adjust this value for the overlap
      child: Container(
        width:
            24.w, // Width equals twice the radius of the CircleAvatar (radius + border)
        height:
            22.h, // Height equals twice the radius of the CircleAvatar (radius + border)
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // The color of the border
            width: 2.0, // Border thickness
          ),
        ),
        child: CircleAvatar(
          radius: 12, // CircleAvatar radius
          backgroundImage: AssetImage(
              profileImg), // The image for the CircleAvatar
        ),
      ),
    );
  }
}
