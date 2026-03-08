import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post_model.dart';
import '../theme/app_theme.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Post get _post => widget.post;

  void _toggleLike() {
    setState(() {
      if (_post.isLiked) {
        _post.likes--;
        _post.isLiked = false;
      } else {
        _post.likes++;
        _post.isLiked = true;
      }
    });
  }

  void _toggleSave() => setState(() => _post.isSaved = !_post.isSaved);

  String _timeAgo(DateTime t) {
    final diff = DateTime.now().difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return DateFormat('MMM d').format(t);
  }

  String _formatCount(int n) {
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: AppTheme.softShadow),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 12, 8),
          child: Row(children: [
            _Avatar(_post.author),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_post.author.displayName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              Text('@${_post.author.username} · ${_timeAgo(_post.timestamp)}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ])),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: Colors.grey)),
          ]),
        ),
        // Emoji block
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 160,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppTheme.primary.withOpacity(0.15), AppTheme.secondary.withOpacity(0.15)]),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(child: Text(_post.emoji, style: const TextStyle(fontSize: 72))),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(_post.content, style: const TextStyle(fontSize: 14, height: 1.5)),
        ),
        if (_post.tags.isNotEmpty) Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(spacing: 6, children: _post.tags.map((t) => Text('#$t', style: TextStyle(color: AppTheme.secondary, fontSize: 13, fontWeight: FontWeight.w600))).toList()),
        ),
        const SizedBox(height: 4),
        // Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(children: [
            _ActionBtn(icon: _post.isLiked ? Icons.favorite : Icons.favorite_border, label: _formatCount(_post.likes), color: _post.isLiked ? Colors.red : Colors.grey, onTap: _toggleLike),
            _ActionBtn(icon: Icons.chat_bubble_outline, label: _formatCount(_post.comments), color: Colors.grey, onTap: () {}),
            _ActionBtn(icon: Icons.share_outlined, label: _formatCount(_post.shares), color: Colors.grey, onTap: () {}),
            const Spacer(),
            IconButton(onPressed: _toggleSave, icon: Icon(_post.isSaved ? Icons.bookmark : Icons.bookmark_border, color: _post.isSaved ? AppTheme.secondary : Colors.grey)),
          ]),
        ),
      ]),
    );
  }
}

class _Avatar extends StatelessWidget {
  final CircloUser user;
  const _Avatar(this.user);

  @override
  Widget build(BuildContext context) => Container(
    width: 44, height: 44,
    decoration: BoxDecoration(gradient: AppTheme.storyGradient, shape: BoxShape.circle),
    child: Center(child: Container(
      width: 40, height: 40,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(child: Text(user.avatar, style: const TextStyle(fontSize: 22))),
    )),
  );
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _ActionBtn({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) => TextButton.icon(
    onPressed: onTap,
    icon: Icon(icon, color: color, size: 20),
    label: Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
  );
}
