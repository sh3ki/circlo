import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/social_data.dart';
import '../theme/app_theme.dart';
import '../widgets/circlo_avatar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _timeAgo(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return DateFormat('MMM d').format(t);
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'like':
        return Icons.favorite_rounded;
      case 'comment':
        return Icons.chat_bubble_rounded;
      case 'follow':
        return Icons.person_add_rounded;
      case 'mention':
        return Icons.alternate_email_rounded;
      default:
        return Icons.notifications_rounded;
    }
  }

  Color _colorForType(String type) {
    switch (type) {
      case 'like':
        return AppTheme.primary;
      case 'comment':
        return AppTheme.accent;
      case 'follow':
        return const Color(0xFF845EC2);
      case 'mention':
        return AppTheme.warning;
      default:
        return AppTheme.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifs = SocialData.notifications;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        title: const Text('Activity'),
        scrolledUnderElevation: 0,
        actions: [
          TextButton(
            onPressed: () =>
                setState(() { for (final n in notifs) n.isRead = true; }),
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
      body: notifs.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications_off_outlined,
                      color: AppTheme.textSecondary, size: 64),
                  const SizedBox(height: 16),
                  const Text(
                    'No notifications yet',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: notifs.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                indent: 76,
                color: AppTheme.divider,
              ),
              itemBuilder: (_, i) {
                final n = notifs[i];
                final iconColor = _colorForType(n.type);

                return GestureDetector(
                  onTap: () => setState(() => n.isRead = true),
                  child: Container(
                    color: n.isRead
                        ? Colors.transparent
                        : AppTheme.primary.withOpacity(0.03),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        // Avatar with notification type badge
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircloAvatar(user: n.from, size: 48),
                            Positioned(
                              right: -2,
                              bottom: -2,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: iconColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2),
                                ),
                                child: Icon(
                                  _iconForType(n.type),
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: n.from.displayName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.textPrimary,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ${n.message}',
                                      style: const TextStyle(
                                        color: AppTheme.textPrimary,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _timeAgo(n.timestamp),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!n.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppTheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
