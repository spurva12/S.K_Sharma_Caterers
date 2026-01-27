import 'package:flutter/material.dart';
import 'package:web/features/widgets/BannerSection.dart';
import 'package:web/features/widgets/GallerySection.dart';
import 'package:web/features/widgets/ServicesSection.dart';
import 'package:web/features/widgets/TrustSection.dart';
import 'widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final homeKey = GlobalKey();
  final servicesKey = GlobalKey();
  final trustKey = GlobalKey();
  final galleryKey = GlobalKey();
  final footerKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            /// BANNER + NAVBAR
            Container(
              key: homeKey,
              child: BannerSection(
                onNavTap: (title) {
                  switch (title) {
                    case 'Home':
                      _scrollTo(homeKey);
                      break;
                    case 'Services':
                      _scrollTo(servicesKey);
                      break;
                    case 'Trust':
                      _scrollTo(trustKey);
                      break;
                    case 'Gallery':
                      _scrollTo(galleryKey);
                      break;
                    case 'Contact':
                      _scrollTo(footerKey);
                      break;
                  }
                },
              ),
            ),

            Container(key: servicesKey, child: const ServicesSection()),
            Container(key: trustKey, child: const TrustSection()),
            Container(key: galleryKey, child: const GallerySection()),
            Container(key: footerKey, child: const Footer()),
          ],
        ),
      ),
    );
  }
}
