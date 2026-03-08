import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final notifs = MockData.notifications;
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        title: const Text('Activity'),
        actions: [
          TextButton(onPressed: () => setState(() { for (final n in notifs) n.isRead = true; }), child: Text('Mark all read', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w700))),
        ],
      ),
      body: notifs.isEmpty
        ? const Center(child: Text('No notifications yet'))
        : ListView.builder(
          itemCount: notifs.length,
          itemBuilder: (_, i) {
            final n = notifs[i];
            return GestureDetector(
              onTap: () => setState(() => n.isRead = true),
              child: Container(
                color: n.isRead ? Colors.transparent : AppTheme.primary.withOpacity(0.05),
                child: ListTile(
                  leading: Stack(children: [
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.1), shape: BoxShape.circle),
                      child: Center(child: Text(n.from.avatar, style: const TextStyle(fontSize: 22))),
                    ),
                    Positioned(right: 0, bottom: 0, child: Text(n.icon, style: const TextStyle(fontSize: 14))),
                  ]),
                  title: RichText(text: TextSpan(children: [
                    TextSpan(text: n.from.displayName, style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black)),
                    TextSpan(text: ' ${n.message}', style: const TextStyle(color: Colors.black87)),
                  ])),
                  subtitle: Text(_timeAgo(n.timestamp), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: n.isRead ? null : Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle)),
                ),
              ),
            );
          },
        ),
    );
  }

  String _timeAgo(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return DateFormat('MMM d').format(t);
  }
}
