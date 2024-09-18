import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:online_course/components/constants/app_color.dart';
import 'package:online_course/components/widgets/card_info.dart';
import 'package:online_course/screens/home_screen.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the controller
    _controller = AnimationController(vsync: this);

    // Play the animation when the screen opens
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _controller.stop(); // Stop after 1 cycle
      }
    });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            lottieDetailsWidget(),
            SizedBox(height: 10.h,),
            doneButtonWidget(),
          ],
        ),
      ),
    );
  }

  Container lottieDetailsWidget() {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Lottie animation for success
                  SizedBox(
                    child: Lottie.asset(
                      'assets/animations/successful .json',
                      controller: _controller,

                      onLoaded: (composition) {
                        // Set the duration for the controller to match the animation
                        _controller.duration = composition.duration;
                        // Start the animation (play once)
                        _controller.forward();
                      },
                      repeat: false, // Ensures the animation runs only once
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Payment Success',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '\$35.00',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  transcriptionCourseDetailsWidget(),
                  SizedBox(height: 20.h),

                  barCodeWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
  }

  Container transcriptionCourseDetailsWidget() {
    return Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 20.w, // Size of the CircleAvatar
                                height: 20.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                          0.2), // Shadow color for elevation
                                      spreadRadius: 1, // Spread radius
                                      blurRadius: 5, // Blur radius
                                      offset: const Offset(
                                          0, 5), // Offset for shadow
                                    ),
                                  ],
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/girl.jpg"), // Replace with your local asset
                                    fit: BoxFit
                                        .cover, // Ensure the image fits the circle properly
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                'Christiana Amandla',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.textSecondaryColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Adobe Xd Editing Course',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 50.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2),
                                    child: Text(
                                      'ID Transcription',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color:
                                              AppColors.textSecondaryColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2),
                                    child: Text(
                                      "TA11231PW",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2),
                                    child: Text(
                                      'Invoice Date',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color:
                                              AppColors.textSecondaryColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2),
                                    child: Text(
                                      "Nov14, 2024",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
  }

  SizedBox doneButtonWidget() {
    return SizedBox(
      width: double.infinity,
      height: 70.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to home screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()), // Replace with your home screen widget
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Done',
              style: TextStyle(fontSize: 18.sp, color: AppColors.blackColor)),
        ),
      ),
    );
  }

  Padding barCodeWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/barcode.jpg"), // Correct way to load an image
            fit: BoxFit.cover, // Adjust how the image fits inside the container
          ),
        ),
      ),
    );
  }
}
