import 'package:flutter/material.dart';
import 'package:web/utils/res/app_color.dart';

class BannerSection extends StatelessWidget {
  final Function(String) onNavTap;

  const BannerSection({
    required this.onNavTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: width < 800 ? 550 : 700,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1551218808-94e220e084d2',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.65),
        ),
        child: Column(
          children: [
            _navBar(context),
            const Spacer(),
            _heroText(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // ================= NAV BAR =================
  Widget _navBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/logo/caterers_logo.png', height: 50),
            const SizedBox(width: 12),
            Text(
              "S.K. Sharma Caterers",
              style: TextStyle(
                fontSize: width < 900 ? 20 : 26,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
        Row(
          children: [
            NavItem("Home", onTap: onNavTap),
            NavItem("Services", onTap: onNavTap),
            NavItem("Trust", onTap: onNavTap),
            NavItem("Gallery", onTap: onNavTap),
            NavItem("Contact", onTap: onNavTap),
          ],
        )
      ],
    );
  }

  // ================= HERO CONTENT =================
  Widget _heroText() {
    return Column(
      children: [
        Text(
          "Delicious Food For Every Occasion",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Weddings • Corporate Events • Parties • Traditional Catering",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

// ================= NAV ITEM =================
class NavItem extends StatelessWidget {
  final String title;
  final Function(String) onTap;

  const NavItem(
      this.title, {
        required this.onTap,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onTap(title),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
