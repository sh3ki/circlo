class CircloUser {
  final String id;
  final String username;
  final String displayName;
  final String avatar;
  final int followers;
  final int following;
  final int postCount;
  final String bio;
  bool isFollowing;

  CircloUser({
    required this.id,
    required this.username,
    required this.displayName,
    required this.avatar,
    this.followers = 0,
    this.following = 0,
    this.postCount = 0,
    this.bio = '',
    this.isFollowing = false,
  });
}

class Post {
  final String id;
  final CircloUser author;
  final String content;
  final String emoji;
  final List<String> tags;
  final DateTime timestamp;
  int likes;
  int comments;
  int shares;
  bool isLiked;
  bool isSaved;

  Post({
    required this.id,
    required this.author,
    required this.content,
    required this.emoji,
    this.tags = const [],
    required this.timestamp,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
    this.isLiked = false,
    this.isSaved = false,
  });
}

class AppNotification {
  final String id;
  final CircloUser from;
  final String type; // like, comment, follow, mention
  final String message;
  final DateTime timestamp;
  bool isRead;

  AppNotification({
    required this.id,
    required this.from,
    required this.type,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  String get icon {
    switch (type) {
      case 'like': return '❤️';
      case 'comment': return '💬';
      case 'follow': return '👤';
      case 'mention': return '@';
      default: return '🔔';
    }
  }
}
