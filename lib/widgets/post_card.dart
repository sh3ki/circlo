import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post_model.dart';
import '../theme/app_theme.dart';
import 'circlo_avatar.dart';

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
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return DateFormat('MMM d').format(t);
  }

  String _formatCount(int n) {
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 10),
            child: Row(
              children: [
                _UserAvatar(user: _post.author, size: 42),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            _post.author.displayName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _post.category,
                              style: TextStyle(
                                color: AppTheme.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '@${_post.author.username} · ${_timeAgo(_post.timestamp)}',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz,
                      color: AppTheme.textSecondary, size: 20),
                ),
              ],
            ),
          ),

          // Content text
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Text(
              _post.content,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ),

          // Image placeholder
          if (_post.imageUrl != null)
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              decoration: BoxDecoration(
                color: AppTheme.divider,
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: NetworkImage(_post.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          // Tags
          if (_post.tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Wrap(
                spacing: 6,
                children: _post.tags
                    .map((t) => Text(
                          '#$t',
                          style: const TextStyle(
                            color: AppTheme.accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    .toList(),
              ),
            ),

          // Actions
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              children: [
                _ActionButton(
                  icon: _post.isLiked
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  label: _formatCount(_post.likes),
                  color: _post.isLiked ? AppTheme.primary : AppTheme.textSecondary,
                  onTap: _toggleLike,
                ),
                _ActionButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: _formatCount(_post.comments),
                  color: AppTheme.textSecondary,
                  onTap: () {},
                ),
                _ActionButton(
                  icon: Icons.share_outlined,
                  label: _formatCount(_post.shares),
                  color: AppTheme.textSecondary,
                  onTap: () {},
                ),
                const Spacer(),
                IconButton(
                  onPressed: _toggleSave,
                  icon: Icon(
                    _post.isSaved
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_outline_rounded,
                    color: _post.isSaved
                        ? AppTheme.secondary
                        : AppTheme.textSecondary,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final CircloUser user;
  final double size;

  const _UserAvatar({required this.user, this.size = 42});

  @override
  Widget build(BuildContext context) {
    return CircloAvatar(user: user, size: size);
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: Size.zero,
      ),
      icon: Icon(icon, color: color, size: 20),
      label: Text(
        label,
        style: TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
