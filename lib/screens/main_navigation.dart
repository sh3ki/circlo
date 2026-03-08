import 'package:flutter/material.dart';
import '../data/mock_data.dart';
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

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const FeedScreen(),
      const DiscoverScreen(),
      const CreatePostScreen(),
      const NotificationsScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final unread = MockData.notifications.where((n) => !n.isRead).length;
    return Scaffold(
      body: IndexedStack(index: _idx, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: AppTheme.primary), label: 'Feed'),
          NavigationDestination(icon: const Icon(Icons.search), selectedIcon: Icon(Icons.search, color: AppTheme.primary), label: 'Discover'),
          NavigationDestination(icon: Container(width: 32, height: 32, decoration: BoxDecoration(gradient: AppTheme.heroGradient, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.add, color: Colors.white, size: 20)), label: 'Create'),
          NavigationDestination(
            icon: Badge(isLabelVisible: unread > 0, label: Text('$unread'), child: const Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(isLabelVisible: unread > 0, label: Text('$unread'), child: Icon(Icons.notifications, color: AppTheme.primary)),
            label: 'Activity',
          ),
          NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: AppTheme.primary), label: 'Profile'),
        ],
      ),
    );
  }
}
