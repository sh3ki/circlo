import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() { _searchCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = MockData.users.where((u) => u.displayName.toLowerCase().contains(_query.toLowerCase()) || u.username.toLowerCase().contains(_query.toLowerCase())).toList();
    final suggestedPosts = MockData.suggestedPosts;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(title: const Text('Discover')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        TextField(
          controller: _searchCtrl,
          onChanged: (v) => setState(() => _query = v),
          decoration: InputDecoration(
            hintText: 'Search people, tags...',
            prefixIcon: const Icon(Icons.search),
            filled: true, fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Suggested People', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredUsers.length,
            itemBuilder: (_, i) {
              final u = filteredUsers[i];
              return Container(
                width: 110,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: AppTheme.softShadow),
                child: Column(children: [
                  Text(u.avatar, style: const TextStyle(fontSize: 32)),
                  const SizedBox(height: 6),
                  Text(u.username, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12), overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => setState(() => u.isFollowing = !u.isFollowing),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(gradient: u.isFollowing ? null : AppTheme.heroGradient, color: u.isFollowing ? Colors.grey[200] : null, borderRadius: BorderRadius.circular(20)),
                      child: Text(u.isFollowing ? 'Following' : 'Follow', style: TextStyle(fontSize: 11, color: u.isFollowing ? Colors.grey : Colors.white, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        const Text('Trending Posts', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: suggestedPosts.map((p) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppTheme.primary.withOpacity(0.2), AppTheme.secondary.withOpacity(0.2)]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(p.emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 4),
              Text('${_formatCount(p.likes)} ❤️', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
            ]),
          )).toList(),
        ),
      ]),
    );
  }

  String _formatCount(int n) => n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}k' : '$n';
}
