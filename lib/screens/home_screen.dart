import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF171826), Color(0xFF13141F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(26.0),
              bottomRight: Radius.circular(26.0),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GOOD MORNING',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: const [
                          Text(
                            'Ahmed Khan ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('👋', style: TextStyle(fontSize: 22)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFF23253A),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white70,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7931E),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFFF7931E,
                              ).withValues(alpha: 0.5),
                              blurRadius: 16,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'AK',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF20212F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[500], size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.3,
                        ),
                        cursorColor: const Color(0xFFF7931E),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Cars, accessories,\nworkshops...',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A2A1A),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFFF7931E),
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'DHA, LHR',
                            style: TextStyle(
                              color: Color(0xFFF7931E),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category cards row
                  SizedBox(
                    height: 204,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _categories.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final cat = _categories[index];

                        return Container(
                          width: 135,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                cat.bgColor,
                                cat.bgColor.withOpacity(0.82),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: cat.bgColor.withOpacity(0.25),
                                blurRadius: 18,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  cat.icon,
                                  color: cat.iconColor,
                                  size: 26,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                cat.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),

                              Text(
                                cat.subtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.75),
                                  fontSize: 12,
                                  height: 1.35,
                                ),
                              ),

                              const Spacer(),

                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: cat.bgColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Promo banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF7A1A), Color(0xFFFF9A3C)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: -20,
                          top: -30,
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          bottom: -40,
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.10),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'LIMITED OFFER',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '20% off first rental',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1.25,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF171826),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Text(
                                      'FIRSTRIDE',
                                      style: TextStyle(
                                        color: Color(0xFFF7931E),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text('🚗', style: TextStyle(fontSize: 56)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Near Me section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Near Me',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Workshops, washes & stations nearby',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF171826),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'See all',
                              style: TextStyle(
                                color: Color(0xFFF7931E),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Color(0xFFF7931E),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 290,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _nearbyPlaces.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final place = _nearbyPlaces[index];
                        return _NearbyPlaceCard(place: place);
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Top Workshops section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Top Workshops',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'All verified & reviewed',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF171826),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'See all',
                              style: TextStyle(
                                color: Color(0xFFF7931E),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Color(0xFFF7931E),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(_workshops.length, (index) {
                    final workshop = _workshops[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index == _workshops.length - 1 ? 0 : 14,
                      ),
                      child: _WorkshopCard(workshop: workshop),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NearbyPlaceCard extends StatelessWidget {
  final _NearbyPlace place;

  const _NearbyPlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= IMAGE =================
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Image.network(
                    place.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),

              // Category Badge
              Positioned(
                left: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    place.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),

              // Favourite Button
              Positioned(
                right: 12,
                top: 12,
                child: Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        // Handle favourite button tap
                      },
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ================= CONTENT =================
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFF7931E),
                            size: 14,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "4.8",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              place.distance,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  place.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF7931E),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Workshop {
  final String name;
  final String category;
  final Color categoryBgColor;
  final Color categoryTextColor;
  final String rating;
  final String reviews;
  final String distance;
  final String imageUrl;
  final bool isTopRated;

  const _Workshop({
    required this.name,
    required this.category,
    required this.categoryBgColor,
    required this.categoryTextColor,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.imageUrl,
    this.isTopRated = false,
  });
}

const List<_Workshop> _workshops = [
  _Workshop(
    name: 'ProCare Detailing',
    category: 'Detailing',
    categoryBgColor: Color(0xFFEDE7FB),
    categoryTextColor: Color(0xFF7C4DFF),
    rating: '4.9',
    reviews: '312',
    distance: '1.2 km',
    imageUrl:
        'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?w=300&q=80',
    isTopRated: true,
  ),
  _Workshop(
    name: 'FastFix Garage',
    category: 'Repair',
    categoryBgColor: Color(0xFFDFF5E6),
    categoryTextColor: Color(0xFF25A45C),
    rating: '4.6',
    reviews: '187',
    distance: '2.8 km',
    imageUrl:
        'https://images.unsplash.com/photo-1632823469850-1b7b1e8b7e1c?w=300&q=80',
  ),
  _Workshop(
    name: 'TurboTech Motors',
    category: 'AC & Denting',
    categoryBgColor: Color(0xFFE2F0FE),
    categoryTextColor: Color(0xFF2F80ED),
    rating: '4.8',
    reviews: '243',
    distance: '3.5 km',
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=300&q=80',
  ),
];

class _WorkshopCard extends StatelessWidget {
  final _Workshop workshop;

  const _WorkshopCard({required this.workshop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= IMAGE =================
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 74,
                  height: 74,
                  child: Image.network(
                    workshop.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      color: const Color(0xFFEFEFF4),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),

              if (workshop.isTopRated)
                Positioned(
                  right: -4,
                  bottom: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7931E),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 14),

          // ================= DETAILS =================
          Expanded(
            child: SizedBox(
              height: 95,
              child: Stack(
                children: [
                  // Left Side
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Text(
                          workshop.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFF7931E),
                            size: 16,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            workshop.rating,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '(${workshop.reviews})',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.grey[500],
                            size: 15,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            workshop.distance,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Category Badge (Top Right)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: workshop.categoryBgColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        workshop.category,
                        style: TextStyle(
                          color: workshop.categoryTextColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Book Button (Bottom Right)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF171826),
                        foregroundColor: const Color(0xFFF7931E),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Book',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Category {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color bgColor;
  final Color iconBgColor;
  final Color iconColor;

  const _Category({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bgColor,
    required this.iconBgColor,
    required this.iconColor,
  });
}

const List<_Category> _categories = [
  _Category(
    title: 'Buy',
    subtitle: 'Cars, bikes & parts',
    icon: Icons.storefront_rounded,
    bgColor: Color(0xFF12131F),
    iconBgColor: Color(0xFF1E2138),
    iconColor: Color(0xFFFF5A3C),
  ),
  _Category(
    title: 'Get on Rent',
    subtitle: 'With or without driver',
    icon: Icons.car_rental_rounded,
    bgColor: Color(0xFF16244A),
    iconBgColor: Color(0xFF223462),
    iconColor: Color(0xFFF7B733),
  ),
  _Category(
    title: 'Detailing',
    subtitle: 'Home or workshop wash',
    icon: Icons.cleaning_services_rounded,
    bgColor: Color(0xFF2A1B57),
    iconBgColor: Color(0xFF3A2B70),
    iconColor: Color(0xFFF7E733),
  ),
  _Category(
    title: 'PPC Wrapping',
    subtitle: 'Full & partial wraps',
    icon: Icons.format_paint_rounded,
    bgColor: Color(0xFF123023),
    iconBgColor: Color(0xFF1E4235),
    iconColor: Colors.white,
  ),
];

class _NearbyPlace {
  final String name;
  final String category;
  final String imageUrl;
  final String distance;
  final String location;

  const _NearbyPlace({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.distance,
    required this.location,
  });
}

const List<_NearbyPlace> _nearbyPlaces = [
  _NearbyPlace(
    name: 'ProCare Workshop',
    category: 'Workshop',
    imageUrl:
        'https://images.unsplash.com/photo-1487754180451-c456f719a1fc?w=500&q=80',
    distance: '1.2 km',
    location: 'Gulberg, LHR',
  ),
  _NearbyPlace(
    name: 'Shine Car Wash',
    category: 'Car Wash',
    imageUrl:
        'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?w=500&q=80',
    distance: '0.8 km',
    location: 'Gulberg, LHR',
  ),
  _NearbyPlace(
    name: 'QuickBike Wash',
    category: 'Bike Wash',
    imageUrl:
        'https://images.unsplash.com/photo-1558981806-ec527fa84c39?w=500&q=80',
    distance: '1.5 km',
    location: 'Model Town, LHR',
  ),
  _NearbyPlace(
    name: 'Total PSO Station',
    category: 'Fuel Station',
    imageUrl:
        'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=500&q=80',
    distance: '2.1 km',
    location: 'Ferozepur Road',
  ),
  _NearbyPlace(
    name: 'ChargeUp EV Station',
    category: 'EV Station',
    imageUrl:
        'https://images.unsplash.com/photo-1593941707882-a5bac6861d75?w=500&q=80',
    distance: '2.8 km',
    location: 'DHA, LHR',
  ),
  _NearbyPlace(
    name: 'AutoZone Showroom',
    category: 'Showroom',
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=500&q=80',
    distance: '3.0 km',
    location: 'Johar Town, LHR',
  ),
];
