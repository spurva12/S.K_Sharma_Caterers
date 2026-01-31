    import 'package:flutter/material.dart';
    import 'package:web/utils/res/app_assets.dart';
    
    void main() {
      runApp(const MyApp());
    }
    
    class MyApp extends StatelessWidget {
      const MyApp({super.key});
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sushil Kumar Sharma Canteens',
          theme: ThemeData(
            primaryColor: const Color(0xFFF39C12), // orange from logo
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Arial',
          ),
          home: const CateringApp(),
        );
      }
    }
    
    class CateringApp extends StatelessWidget {
      const CateringApp({super.key});
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SK Sharma Caterers',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: const Color(0xFF8B0000),
            fontFamily: 'Arial',
          ),
          home: const HomePage(),
        );
      }
    }
    
    final homeKey = GlobalKey();
    final servicesKey = GlobalKey();
    final galleryKey = GlobalKey();
    final aboutKey = GlobalKey();
    final contactKey = GlobalKey();

    PreferredSizeWidget buildHeader(BuildContext context) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Image.asset(AppAssets.logo, height: 40),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Sushil Kumar Sharma Canteens',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis, // prevent overflow
              ),
            ),
          ],
        ),
        actions: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  children: [
                    _navItem('Home', homeKey),
                    _navItem('Services', servicesKey),
                    _navItem('Gallery', galleryKey),
                    _navItem('About', aboutKey),
                    _navItem('Contact', contactKey),
                    const SizedBox(width: 20),
                  ],
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              }
            },
          ),
        ],
      );
    }


    // Drawer for mobile menu
    Drawer buildDrawer(BuildContext context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Image.asset(AppAssets.logo, height: 60),
            ),
            ListTile(title: const Text('Home'), onTap: () { /* scroll or navigate */ }),
            ListTile(title: const Text('Services'), onTap: () {}),
            ListTile(title: const Text('Gallery'), onTap: () {}),
            ListTile(title: const Text('About'), onTap: () {}),
            ListTile(title: const Text('Contact'), onTap: () {}),
          ],
        ),
      );
    }


    Widget _navItem(String title, GlobalKey key) {
      return TextButton(
        onPressed: () {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        },
        child: Text(title, style: const TextStyle(color: Colors.black)),
      );
    }
    
    class HomePage extends StatelessWidget {
      const HomePage({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: buildHeader(context), // STATIC HEADER
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(key: homeKey),
                ServicesSection(key: servicesKey),
                GallerySection(key: galleryKey),
                AboutSection(key: aboutKey),
                ContactSection(key: contactKey),
                const FooterSection(),
              ],
            ),
          ),
        );
      }
    }
    
    // ---------------- HEADER ----------------
    class HeaderSection extends StatelessWidget {
      const HeaderSection({super.key});
    
      @override
      Widget build(BuildContext context) {
        final isMobile = MediaQuery.of(context).size.width < 800;
    
        return Container(
          height: isMobile ? 500 : 600,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8B0000), Color(0xFFFFC107)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: isMobile ? _mobileHeader() : _desktopHeader(),
          ),
        );
      }
    
      Widget _desktopHeader() {
        return Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delicious Catering For Every Occasion',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Weddings • Corporate Events • Parties',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Book Now'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  AppAssets.logo,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        );
      }
    
      Widget _mobileHeader() {
        return Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Delicious Catering For Every Occasion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Weddings • Corporate Events • Parties',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(onPressed: () {}, child: const Text('Book Now')),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(AppAssets.logo,
                  height: 160,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        );
      }
    }
    
    // ---------------- SERVICES ----------------
    class ServiceCard extends StatefulWidget {
      final IconData icon;
      final String title;
      final String description;
    
      const ServiceCard({
        super.key,
        required this.icon,
        required this.title,
        required this.description,
      });
    
      @override
      State<ServiceCard> createState() => _ServiceCardState();
    }
    
    class _ServiceCardState extends State<ServiceCard> {
      bool isHover = false;
    
      @override
      Widget build(BuildContext context) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform:
                isHover
                    ? (Matrix4.identity()..translate(0, -8))
                    : Matrix4.identity(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors:
                    isHover
                        ? [const Color(0xFFF39C12), const Color(0xFFF7B733)]
                        : [Colors.white, Colors.white],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 48,
                  color: isHover ? Colors.white : const Color(0xFFF39C12),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isHover ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: isHover ? Colors.white70 : Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    
    class ServicesSection extends StatelessWidget {
      const ServicesSection({super.key});
    
      @override
      Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final crossAxisCount = width < 900 ? 1 : 3;
    
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          color: const Color(0xFFFDF6EC), // soft background
          child: Column(
            children: [
              const Text(
                'Our Services',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Quality catering tailored for every occasion',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 50),
    
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1.1,
                children: const [
                  ServiceCard(
                    icon: Icons.favorite,
                    title: 'Wedding Catering',
                    description:
                        'Luxury menus, elegant presentation, and flawless service for your special day.',
                  ),
                  ServiceCard(
                    icon: Icons.business_center,
                    title: 'Corporate Events',
                    description:
                        'Professional and hygienic catering solutions for meetings, offices, and conferences.',
                  ),
                  ServiceCard(
                    icon: Icons.celebration,
                    title: 'Party Orders',
                    description:
                        'Delicious food for birthdays, anniversaries, house parties, and celebrations.',
                  ),
                ],
              ),
            ],
          ),
        );
      }
    }
    
    // ---------------- ABOUT ----------------
    class AboutSection extends StatelessWidget {
      const AboutSection({super.key});
    
      @override
      Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final isDesktop = width > 900;
    
        return Container(
          width: double.infinity,
          color: const Color(0xFFF9F9F9),
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          child: Column(
            children: [
              const Text(
                'About Us',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              const Text(
                'Serving quality, taste, and trust for every occasion',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
    
              SizedBox(
                width: 1100,
                child:
                    isDesktop
                        ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(child: _AboutText()),
                            SizedBox(width: 60),
                            Expanded(child: _AboutHighlights()),
                          ],
                        )
                        : Column(
                          children: const [
                            _AboutText(),
                            SizedBox(height: 40),
                            _AboutHighlights(),
                          ],
                        ),
              ),
            ],
          ),
        );
      }
    }
    
    class _AboutText extends StatelessWidget {
      const _AboutText();
    
      @override
      Widget build(BuildContext context) {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who We Are',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'SK Sharma Caterers is a trusted name in professional catering services, '
              'known for delivering delicious food, hygienic preparation, and '
              'exceptional service. With years of experience in wedding catering, '
              'corporate events, and private functions, we understand the importance '
              'of quality and consistency.',
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
            ),
            SizedBox(height: 16),
            Text(
              'Our team of skilled chefs and service staff work passionately to create '
              'memorable dining experiences, using fresh ingredients and customized '
              'menus tailored to your needs.',
              style: TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
            ),
          ],
        );
      }
    }
    
    class _AboutHighlights extends StatelessWidget {
      const _AboutHighlights();
    
      @override
      Widget build(BuildContext context) {
        return Column(
          children: const [
            _HighlightItem(
              icon: Icons.restaurant_menu,
              title: 'Quality Ingredients',
              subtitle: 'Fresh, hygienic, and carefully selected ingredients.',
            ),
            SizedBox(height: 20),
            _HighlightItem(
              icon: Icons.people,
              title: 'Experienced Team',
              subtitle: 'Professional chefs and trained service staff.',
            ),
            SizedBox(height: 20),
            _HighlightItem(
              icon: Icons.thumb_up_alt,
              title: 'Trusted Service',
              subtitle: 'Reliable catering for weddings and corporate events.',
            ),
          ],
        );
      }
    }
    
    class _HighlightItem extends StatelessWidget {
      final IconData icon;
      final String title;
      final String subtitle;
    
      const _HighlightItem({
        required this.icon,
        required this.title,
        required this.subtitle,
      });
    
      @override
      Widget build(BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF39C12).withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 28, color: const Color(0xFFF39C12)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    }
    
    // ---------------- GALLERY ----------------
    class GallerySection extends StatelessWidget {
      const GallerySection({super.key});
    
      @override
      Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final crossAxisCount =
            width < 600
                ? 2
                : width < 1000
                ? 3
                : 4;
    
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          color: Colors.white,
          child: Column(
            children: [
              const Text(
                'Our Gallery',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'A glimpse of our delicious food & beautiful events',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
    
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return const _GalleryItem();
                },
              ),
            ],
          ),
        );
      }
    }
    
    class _GalleryItem extends StatefulWidget {
      const _GalleryItem();
    
      @override
      State<_GalleryItem> createState() => _GalleryItemState();
    }
    
    class _GalleryItemState extends State<_GalleryItem> {
      bool isHover = false;
    
      @override
      Widget build(BuildContext context) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  /// IMAGE PLACEHOLDER
                  Image.asset(
                    AppAssets.food, // replace with real image
                    fit: BoxFit.cover,
                  ),
    
                  /// DARK OVERLAY ON HOVER
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: isHover ? 1 : 0,
                    child: Container(color: Colors.black.withOpacity(0.55)),
                  ),
    
                  /// ICON + TEXT
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: isHover ? 1 : 0,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.zoom_in, color: Colors.white, size: 36),
                          SizedBox(height: 8),
                          Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    
    // ---------------- CONTACT ----------------
    class ContactSection extends StatelessWidget {
      const ContactSection({super.key});
    
      @override
      Widget build(BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final isDesktop = width > 900;
    
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8B0000), Color(0xFFB22222)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Let’s plan something delicious together',
                style: TextStyle(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
    
              SizedBox(
                width: 1100,
                child:
                    isDesktop
                        ? Row(
                          children: const [
                            Expanded(child: _ContactInfo()),
                            SizedBox(width: 40),
                            Expanded(child: _ContactCTA()),
                          ],
                        )
                        : Column(
                          children: const [
                            _ContactInfo(),
                            SizedBox(height: 40),
                            _ContactCTA(),
                          ],
                        ),
              ),
            ],
          ),
        );
      }
    }
    
    class _ContactInfo extends StatelessWidget {
      const _ContactInfo();
    
      @override
      Widget build(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _ContactItem(
              icon: Icons.phone,
              title: 'Phone',
              value: '+91 9811265515 | +91 8384885749 | +91 9810558385 ',
            ),
            SizedBox(height: 20),
            _ContactItem(
              icon: Icons.email,
              title: 'Email',
              value: 'sharmanishank05@gmail.com',
            ),
            SizedBox(height: 20),
            _ContactItem(
              icon: Icons.location_on,
              title: 'Location',
              value: 'Sita Ram Bajar, Gali Aaray Samaj, Delhi-6, 110006, India',
            ),
          ],
        );
      }
    }
    
    class _ContactCTA extends StatelessWidget {
      const _ContactCTA();
    
      @override
      Widget build(BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Book Your Event',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Get in touch with us today to discuss your catering requirements.',
                style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.call, color: Colors.white),
                label: const Text(
                  'Call Now',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }
    }
    
    class _ContactItem extends StatelessWidget {
      final IconData icon;
      final String title;
      final String value;
    
      const _ContactItem({
        required this.icon,
        required this.title,
        required this.value,
      });
    
      @override
      Widget build(BuildContext context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 26),
            ),
            const SizedBox(width: 20),
    
            /// ✅ THIS FIXES OVERFLOW
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    value,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    }
    
    // ---------------- FOOTER ----------------
    class FooterSection extends StatelessWidget {
      const FooterSection({super.key});
    
      @override
      Widget build(BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          color: Colors.black,
          child: const Text(
            '© 2026 SK Sharma Caterers. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54),
          ),
        );
      }
    }
