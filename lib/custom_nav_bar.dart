import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onSellWithUs;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.onSellWithUs,
  });

  static const List<_NavItem> items = [
    _NavItem(
      activeIcon: Icons.home_rounded,
      icon: Icons.home_rounded,
      label: 'Home',
      screen: HomeScreen(),
    ),
    _NavItem(
      activeIcon: Icons.favorite,
      icon: Icons.favorite_border,
      label: 'Favorites',
      screen: Placeholder(),
    ),
    _NavItem(
      activeIcon: Icons.map,
      icon: Icons.map_outlined,
      label: 'Workshop',
      screen: Placeholder(),
    ),
    _NavItem(
      activeIcon: Icons.person,
      icon: Icons.person_outline_rounded,
      label: 'Profile',
      screen: Placeholder(),
    ),
  ];

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  Widget _buildNavItem(int index) {
    final bool isSelected = index == widget.selectedIndex;
    final item = CustomBottomNavBar.items[index];

    return GestureDetector(
      onTap: () => widget.onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        scale: isSelected ? 1.08 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF171826)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: Icon(
                    isSelected ? item.activeIcon : item.icon,
                    key: ValueKey(isSelected),
                    size: 22,
                    color: isSelected
                        ? const Color(0xFFF7931E)
                        : const Color(0xFFB8BCC8),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF171826)
                      : const Color(0xFFB8BCC8),
                ),
                child: Text(item.label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0),
            _buildNavItem(1),
            _SellWithUsButton(onTap: widget.onSellWithUs),
            _buildNavItem(2),
            _buildNavItem(3),
          ],
        ),
      ),
    );
  }
}

class _SellWithUsButton extends StatefulWidget {
  final VoidCallback onTap;

  const _SellWithUsButton({super.key, required this.onTap});

  @override
  State<_SellWithUsButton> createState() => _SellWithUsButtonState();
}

class _SellWithUsButtonState extends State<_SellWithUsButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFB25C), Color(0xFFF7931E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF7931E).withOpacity(0.45),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.sell_rounded,
                size: 20,
                color: Color(0xFF171826),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Widget screen;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.screen,
  });
}
