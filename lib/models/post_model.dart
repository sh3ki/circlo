class CircloUser {
  final String id;
  final String username;
  final String displayName;
  final String avatar;
  final String? avatarUrl;
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
    this.avatarUrl,
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
  final String category;
  final String content;
  final List<String> tags;
  final DateTime timestamp;
  final String? imageUrl;
  int likes;
  int comments;
  int shares;
  bool isLiked;
  bool isSaved;

  Post({
    required this.id,
    required this.author,
    required this.category,
    required this.content,
    this.tags = const [],
    required this.timestamp,
    this.imageUrl,
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
  final String type;
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
}
