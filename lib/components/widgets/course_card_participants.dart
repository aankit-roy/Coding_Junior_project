import 'package:flutter/material.dart';

class CourseCardWithParticipants extends StatelessWidget {

  final List<String> participantImages; // List of participant image URLs or asset paths
  final int additionalParticipants;

  const CourseCardWithParticipants({
    super.key,

    required this.participantImages,
    required this.additionalParticipants,
  });

  @override
  Widget build(BuildContext context) {
    return     Row(
      children: [
        Stack(
          children: _buildParticipants(),
        ),
        const SizedBox(width: 8),
        const Text(
          'Participants',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper function to build the list of participant avatars with the "+N" badge
  List<Widget> _buildParticipants() {
    List<Widget> avatars = [];

    // Show a maximum of 3 participants with the rest represented by "+N"
    for (int i = 0; i < participantImages.length && i < 3; i++) {
      avatars.add(
        Positioned(
          left: i * 20.0, // Offset by 20 pixels for overlapping effect
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(participantImages[i]),
          ),
        ),
      );
    }

    // Add "+N" for the additional participants
    if (additionalParticipants > 0) {
      avatars.add(
        Positioned(
          left: 60, // Position the "+N" circle at the end
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.green,
            child: Text(
              '+$additionalParticipants',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    }

    return avatars;
  }
}