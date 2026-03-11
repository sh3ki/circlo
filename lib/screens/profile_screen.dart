import 'package:flutter/material.dart';
import '../data/social_data.dart';
import '../theme/app_theme.dart';
import '../widgets/circlo_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  String _fmt(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}k' : '$n';

  @override
  Widget build(BuildContext context) {
    final me = SocialData.selfUser;
    final myPosts = SocialData.posts.take(6).toList();

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: CustomScrollView(
        slivers: [
          // App bar
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            title: Text(
              '@${me.username}',
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined,
                    color: AppTheme.textPrimary),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Avatar
                        CircloAvatar(user: me, size: 76),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              _StatColumn(
                                  me.postCount.toString(), 'Posts'),
                              _StatColumn(_fmt(me.followers), 'Followers'),
                              _StatColumn('${me.following}', 'Following'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            me.displayName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            me.bio,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Action buttons
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textPrimary,
                        side: const BorderSide(color: AppTheme.divider),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textPrimary,
                      side: const BorderSide(color: AppTheme.divider),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                    ),
                    child: const Icon(Icons.share_outlined, size: 18),
                  ),
                ],
              ),
            ),
          ),

          // Tab bar (Posts / Saved)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Row(
                children: [
                  _TabButton(label: 'Posts', active: true),
                  const SizedBox(width: 12),
                  _TabButton(label: 'Saved', active: false),
                ],
              ),
            ),
          ),

          // Post grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (_, i) {
                  final post = myPosts[i];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: AppTheme.cardShadow,
                      image: post.imageUrl != null
                          ? DecorationImage(
                              image: NetworkImage(post.imageUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: post.imageUrl == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  post.category,
                                  style: const TextStyle(
                                    color: AppTheme.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${_fmt(post.likes)} likes',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          )
                        : null,
                  );
                },
                childCount: myPosts.length,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const _StatColumn(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: AppTheme.textPrimary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool active;

  const _TabButton({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppTheme.secondary : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: active ? AppTheme.secondary : AppTheme.divider,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : AppTheme.textSecondary,
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }
}
