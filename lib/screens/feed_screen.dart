import 'package:flutter/material.dart';
import '../data/social_data.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';
import '../widgets/circlo_avatar.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            titleSpacing: 16,
            title: const AppLogo(size: 34),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send_rounded,
                      color: AppTheme.textPrimary, size: 22),
                ),
              ),
            ],
          ),

          // Stories row
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: SocialData.users.length + 1,
                itemBuilder: (_, i) {
                  if (i == 0) {
                    return _buildYourStory();
                  }
                  final u = SocialData.users[i - 1];
                  final colorIdx =
                      u.id.hashCode % AppTheme.storyColors.length;
                  final color =
                      AppTheme.storyColors[colorIdx.abs()];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: color, width: 2.5),
                          ),
                          child: CircloAvatar(user: u, size: 54),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 60,
                          child: Text(
                            u.username,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppTheme.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Divider
          SliverToBoxAdapter(
            child: Container(
              height: 1,
              color: AppTheme.divider,
              margin: const EdgeInsets.only(bottom: 4),
            ),
          ),

          // Posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => PostCard(post: SocialData.posts[i]),
              childCount: SocialData.posts.length,
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Stack(
            children: [
              CircloAvatar(user: SocialData.selfUser, size: 60),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Your story',
            style: TextStyle(fontSize: 10, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }
}
