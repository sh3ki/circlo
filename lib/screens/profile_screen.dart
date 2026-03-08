import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final me = MockData.selfUser;
    final myPosts = MockData.posts.take(6).toList();

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 220,
          pinned: true,
          backgroundColor: Colors.white,
          title: Text(me.username, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(children: [
                Row(children: [
                  Container(
                    width: 80, height: 80,
                    decoration: BoxDecoration(gradient: AppTheme.storyGradient, shape: BoxShape.circle),
                    child: Center(child: Container(
                      width: 74, height: 74,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: Center(child: Text(me.avatar, style: const TextStyle(fontSize: 38))),
                    )),
                  ),
                  const SizedBox(width: 24),
                  Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    _Stat(me.postCount.toString(), 'Posts'),
                    _Stat('${_fmt(me.followers)}', 'Followers'),
                    _Stat('${me.following}', 'Following'),
                  ])),
                ]),
                const SizedBox(height: 10),
                Align(alignment: Alignment.centerLeft, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(me.displayName, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(me.bio, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                ])),
              ]),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(padding: const EdgeInsets.fromLTRB(20, 12, 20, 0), child: Row(children: [
            Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w700)))),
            const SizedBox(width: 12),
            OutlinedButton(onPressed: () {}, child: const Icon(Icons.person_add_outlined)),
          ])),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, i) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [AppTheme.primary.withOpacity(0.2), AppTheme.secondary.withOpacity(0.2)]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(myPosts[i].emoji, style: const TextStyle(fontSize: 36)),
                  const SizedBox(height: 4),
                  Text('${_fmt(myPosts[i].likes)} ❤️', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                ]),
              ),
              childCount: myPosts.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ]),
    );
  }

  String _fmt(int n) => n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}k' : '$n';
}

class _Stat extends StatelessWidget {
  final String value, label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) => Column(children: [
    Text(value, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
    Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
  ]);
}
