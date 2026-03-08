import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        title: const AppLogo(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Stories row
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: MockData.users.length + 1,
                itemBuilder: (_, i) {
                  if (i == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(children: [
                        Stack(children: [
                          Container(
                            width: 60, height: 60,
                            decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.1), shape: BoxShape.circle),
                            child: const Center(child: Text('🌸', style: TextStyle(fontSize: 28))),
                          ),
                          Positioned(right: 0, bottom: 0, child: Container(
                            width: 20, height: 20,
                            decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle),
                            child: const Icon(Icons.add, color: Colors.white, size: 14),
                          )),
                        ]),
                        const SizedBox(height: 4),
                        const Text('Your story', style: TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis),
                      ]),
                    );
                  }
                  final u = MockData.users[i - 1];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(children: [
                      Container(
                        width: 60, height: 60,
                        decoration: BoxDecoration(gradient: AppTheme.storyGradient, shape: BoxShape.circle),
                        child: Center(child: Container(
                          width: 54, height: 54,
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Center(child: Text(u.avatar, style: const TextStyle(fontSize: 26))),
                        )),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(width: 60, child: Text(u.username, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis)),
                    ]),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Divider(height: 1)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => PostCard(post: MockData.posts[i]),
              childCount: MockData.posts.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
