import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/components/constants/app_color.dart';
import 'package:online_course/components/widgets/card_info.dart';
import 'package:online_course/components/widgets/course_card_participants.dart';
import 'package:online_course/components/widgets/section_holder.dart';
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
            // Participants section
            // Row(
            //   children: [
            //     Stack(
            //       children: [
            //         // First participant
            //         Positioned(
            //           left: 0,
            //           child: CircleAvatar(
            //             radius: 15,
            //             backgroundImage: AssetImage(participantImages[0]), // Assuming image from assets
            //           ),
            //         ),
            //         // Second participant (slightly overlapping)
            //         Positioned(
            //           left: 20,
            //           child: CircleAvatar(
            //             radius: 15,
            //             backgroundImage: AssetImage(participantImages[1]),
            //           ),
            //         ),
            //         // Third participant (slightly overlapping)
            //         Positioned(
            //           left: 40,
            //           child: CircleAvatar(
            //             radius: 15,
            //             backgroundImage: AssetImage(participantImages[2]),
            //           ),
            //         ),
            //         // Additional participants (green circle with "+20")
            //         Positioned(
            //           left: 60,
            //           child: CircleAvatar(
            //             radius: 15,
            //             backgroundColor: Colors.green,
            //             child: Text(
            //               '+$additionalParticipants',
            //               style: const TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 12,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     const SizedBox(width: 8),
            // Participant text

            //   ],
            // ),

            // Text(
            //   '$participants Participants',
            //   style: const TextStyle(color: Colors.grey, fontSize: 12),
            // ),
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
            // SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                color: Colors.grey.shade200,    // Set the color of the divider
                thickness: 2,          // Set the thickness of the divider
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
                      style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.play_circle_outline_rounded,size: 18,color: Colors.grey.shade400,),
                    ),
                    Text(
                      '$lessons Lessons',
                      style:  TextStyle(fontSize: 12.sp, color: Colors.grey),
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
}