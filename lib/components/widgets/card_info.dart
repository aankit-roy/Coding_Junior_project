import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/components/constants/app_color.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int data;
  final IconData icon;

  const InfoCard({
    super.key,
    required this.title,    // Dynamic title
    required this.data,     // Dynamic integer data
    required this.icon,     // Dynamic icon
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Icon container
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 45.0, // Replace 45.w with fixed values if you don't use Flutter's screen_utils or similar package
                height: 45.0,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor, // Replace AppColors.secondaryColor with your custom color
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  icon, // Dynamic icon passed via constructor
                  color: AppColors.primaryColor, // Replace with your theme or custom color
                ),
              ),
            ),
            // Text Information Column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // Dynamic title passed via constructor
                    style:  TextStyle(fontSize: 16.sp), // Dynamic styling can be added if needed
                  ),
                  Text(
                    '$data', // Dynamic data passed via constructor
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

