import 'package:flutter/material.dart';
import '../data/social_data.dart';
import '../theme/app_theme.dart';
import 'feed_screen.dart';
import 'discover_screen.dart';
import 'create_post_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _idx = 0;

  late final List<Widget> _screens = [
    const FeedScreen(),
    const DiscoverScreen(),
    const CreatePostScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final unread = SocialData.notifications.where((n) => !n.isRead).length;

    return Scaffold(
      body: IndexedStack(index: _idx, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.secondary.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                _NavTab(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: 'Feed',
                  active: _idx == 0,
                  onTap: () => setState(() => _idx = 0),
                ),
                _NavTab(
                  icon: Icons.search_rounded,
                  activeIcon: Icons.search_rounded,
                  label: 'Discover',
                  active: _idx == 1,
                  onTap: () => setState(() => _idx = 1),
                ),
                _CenterTab(
                  onTap: () => setState(() => _idx = 2),
                  active: _idx == 2,
                ),
                _NavTab(
                  icon: Icons.notifications_outlined,
                  activeIcon: Icons.notifications_rounded,
                  label: 'Activity',
                  active: _idx == 3,
                  badge: unread,
                  onTap: () => setState(() => _idx = 3),
                ),
                _NavTab(
                  icon: Icons.person_outlined,
                  activeIcon: Icons.person_rounded,
                  label: 'Profile',
                  active: _idx == 4,
                  onTap: () => setState(() => _idx = 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool active;
  final int badge;
  final VoidCallback onTap;

  const _NavTab({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.active,
    this.badge = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  active ? activeIcon : icon,
                  color: active ? AppTheme.primary : AppTheme.textSecondary,
                  size: 24,
                ),
                if (badge > 0)
                  Positioned(
                    top: -4,
                    right: -8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$badge',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: active ? AppTheme.primary : AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterTab extends StatelessWidget {
  final VoidCallback onTap;
  final bool active;

  const _CenterTab({required this.onTap, required this.active});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: active ? AppTheme.primary : AppTheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add_rounded, color: Colors.white, size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
