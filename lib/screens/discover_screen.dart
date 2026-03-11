import 'package:flutter/material.dart';
import '../data/social_data.dart';
import '../theme/app_theme.dart';
import '../widgets/circlo_avatar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  String _formatCount(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}k' : '$n';

  @override
  Widget build(BuildContext context) {
    final filteredUsers = SocialData.users
        .where((u) =>
            u.displayName.toLowerCase().contains(_query.toLowerCase()) ||
            u.username.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    final suggestedPosts = SocialData.suggestedPosts;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        title: const Text('Discover'),
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: AppTheme.cardShadow,
            ),
            child: TextField(
              controller: _searchCtrl,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Search people, tags...',
                hintStyle: const TextStyle(color: AppTheme.textSecondary),
                prefixIcon:
                    const Icon(Icons.search, color: AppTheme.textSecondary),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Suggested People
          const Text(
            'Suggested People',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 17,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 152,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredUsers.length,
              itemBuilder: (_, i) {
                final u = filteredUsers[i];

                return Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: Column(
                    children: [
                      CircloAvatar(user: u, size: 46),
                      const SizedBox(height: 8),
                      Text(
                        u.displayName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${_formatCount(u.followers)} followers',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () =>
                            setState(() => u.isFollowing = !u.isFollowing),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          decoration: BoxDecoration(
                            color: u.isFollowing
                                ? AppTheme.divider
                                : AppTheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            u.isFollowing ? 'Following' : 'Follow',
                            style: TextStyle(
                              fontSize: 11,
                              color: u.isFollowing
                                  ? AppTheme.textSecondary
                                  : Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Trending Posts
          const Text(
            'Trending Posts',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 17,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.1,
            children: suggestedPosts.map((p) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: AppTheme.cardShadow,
                  image: p.imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(p.imageUrl!),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                        )
                      : null,
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        p.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${_formatCount(p.likes)} likes',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
