import 'package:flutter/material.dart';
import 'package:web/utils/res/app_color.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Column(
        children: [
          const Text(
            'Our Services',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: const [
              ServiceCard('Institutional Canteens'),
              ServiceCard('Industrial Catering'),
              ServiceCard('Hygienic Meal Planning'),
              ServiceCard('Bulk Food Services'),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  const ServiceCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.darkBrown,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
