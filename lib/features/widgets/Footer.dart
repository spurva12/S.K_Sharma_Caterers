
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/utils/res/app_color.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBrown,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          const Text('Email: sharmanishank05@gmail.com',
              style: TextStyle(color: Colors.white70)),
          const Text('Sushil Kumar Sharma: +91 98765 43210',
              style: TextStyle(color: Colors.white70)),
          const Text('Nishank Sharma: +91 91234 56789',
              style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 10),
          Row(
            children: const [
              FaIcon(FontAwesomeIcons.facebook, color: Colors.white70, size: 18),
              SizedBox(width: 10),
              FaIcon(FontAwesomeIcons.instagram, color: Colors.white70, size: 18),
              SizedBox(width: 10),
              FaIcon(FontAwesomeIcons.twitter, color: Colors.white70, size: 18),
            ],
          )
        ],
      ),
    );
  }
}
