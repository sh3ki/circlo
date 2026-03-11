import '../models/post_model.dart';

class SocialData {
  SocialData._();

  static final CircloUser selfUser = CircloUser(
    id: 'self',
    username: 'jordancirclo',
    displayName: 'Jordan Clarke',
    avatar: 'JC',
    avatarUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150&h=150&fit=crop',
    followers: 842,
    following: 319,
    postCount: 47,
    bio: 'Living, laughing, creating | Flutter dev by day',
  );

  static final List<CircloUser> users = [
    CircloUser(id: 'u1', username: 'nova_art', displayName: 'Nova Martinez', avatar: 'NM', avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&h=150&fit=crop', followers: 12400, following: 312, postCount: 203, bio: 'Digital artist & dreamer', isFollowing: true),
    CircloUser(id: 'u2', username: 'fitjordan', displayName: 'Jordan Reeves', avatar: 'JR', avatarUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150&h=150&fit=crop', followers: 5800, following: 201, postCount: 89, bio: 'Fitness coach | Eat well, move daily', isFollowing: true),
    CircloUser(id: 'u3', username: 'chef_mia', displayName: 'Mia Chen', avatar: 'MC', avatarUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=150&h=150&fit=crop', followers: 38200, following: 145, postCount: 451, bio: 'Food is love | Recipe creator', isFollowing: false),
    CircloUser(id: 'u4', username: 'techwave', displayName: 'Alex Rivera', avatar: 'AR', avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop', followers: 21000, following: 89, postCount: 312, bio: 'Tech trends, tools & tips'),
    CircloUser(id: 'u5', username: 'travel.ada', displayName: 'Ada Thompson', avatar: 'AT', avatarUrl: 'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=150&h=150&fit=crop', followers: 67500, following: 502, postCount: 670, bio: 'Exploring the world one city at a time', isFollowing: true),
    CircloUser(id: 'u6', username: 'mindfulgrace', displayName: 'Grace Kim', avatar: 'GK', avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&h=150&fit=crop', followers: 9200, following: 430, postCount: 128, bio: 'Mindfulness & wellness advocate', isFollowing: false),
    CircloUser(id: 'u7', username: 'leo_photo', displayName: 'Leo Santos', avatar: 'LS', avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop', followers: 44100, following: 672, postCount: 890, bio: 'Photographer | Capturing moments', isFollowing: true),
    CircloUser(id: 'u8', username: 'bookworm_sam', displayName: 'Sam Park', avatar: 'SP', avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=150&h=150&fit=crop', followers: 7800, following: 290, postCount: 156, bio: 'Books, coffee, repeat', isFollowing: false),
  ];

  static DateTime _ago({int h = 0, int m = 0}) =>
      DateTime.now().subtract(Duration(hours: h, minutes: m));

  static final List<Post> posts = [
    Post(id: 'p1', author: users[0], category: 'Art', content: 'Just finished my latest digital painting! This one took 3 weeks but worth every hour. What do you think?', tags: ['art', 'digital', 'creative'], timestamp: _ago(m: 15), likes: 1240, comments: 84, shares: 32, imageUrl: 'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=400'),
    Post(id: 'p2', author: users[4], category: 'Travel', content: 'Kyoto in the morning mist is absolutely breathtaking. Woke up at 4am just for this view and zero regrets.', tags: ['travel', 'japan', 'kyoto'], timestamp: _ago(h: 1), likes: 4521, comments: 203, shares: 167, imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400'),
    Post(id: 'p3', author: users[1], category: 'Fitness', content: 'New PR on deadlifts today! 180kg. Consistency is everything — 3 years of showing up every single day.', tags: ['fitness', 'gym', 'motivation'], timestamp: _ago(h: 2, m: 30), likes: 892, comments: 67, shares: 43, isLiked: true, imageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400'),
    Post(id: 'p4', author: users[2], category: 'Food', content: 'Homemade carbonara from scratch — no cream, just eggs, pecorino and guanciale. Recipe in comments!', tags: ['food', 'pasta', 'cooking'], timestamp: _ago(h: 4), likes: 2108, comments: 312, shares: 98, imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400'),
    Post(id: 'p5', author: users[6], category: 'Photography', content: 'Golden hour over the ocean. No filter needed when nature does the work. This is why I love photography.', tags: ['photography', 'sunset', 'ocean'], timestamp: _ago(h: 5), likes: 3340, comments: 128, shares: 204, isLiked: true, imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400'),
    Post(id: 'p6', author: users[3], category: 'Tech', content: 'The latest framework updates just dropped! App development is about to change completely. Thread of the best new features below.', tags: ['tech', 'flutter', 'dev'], timestamp: _ago(h: 6), likes: 1567, comments: 245, shares: 432, imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400'),
    Post(id: 'p7', author: users[5], category: 'Wellness', content: 'Morning meditation changed my life. Just 10 minutes a day for 6 months and my anxiety is completely different. Start small.', tags: ['mindfulness', 'wellness', 'meditation'], timestamp: _ago(h: 8), likes: 967, comments: 89, shares: 234, isSaved: true, imageUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=400'),
    Post(id: 'p8', author: users[7], category: 'Books', content: 'Finished "Thinking Fast and Slow" and my mind is officially blown. Kahneman is a genius. Who else has read this?', tags: ['books', 'reading', 'psychology'], timestamp: _ago(h: 12), likes: 432, comments: 76, shares: 54, imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
    Post(id: 'p9', author: users[0], category: 'Art', content: 'Color theory is my obsession recently. Every hue tells a story. Which palette speaks to you? Warm sunset or Cool ocean?', tags: ['art', 'colortheory', 'creative'], timestamp: _ago(h: 18), likes: 2890, comments: 441, shares: 89, isLiked: true, imageUrl: 'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=400'),
    Post(id: 'p10', author: users[4], category: 'Travel', content: 'Paris at 2am hits differently. The city is alive in a completely unique way when the tourists are asleep.', tags: ['travel', 'paris', 'night'], timestamp: _ago(h: 22), likes: 5213, comments: 312, shares: 278, imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400'),
    Post(id: 'p11', author: users[1], category: 'Fitness', content: 'Meal prep Sunday! 5 days of healthy eating ready to go. Macros calculated, goals locked in.', tags: ['fitness', 'nutrition', 'mealprep'], timestamp: _ago(h: 28), likes: 1124, comments: 94, shares: 67, imageUrl: 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=400'),
    Post(id: 'p12', author: users[2], category: 'Food', content: '72-hour cold ferment pizza dough. This is the only recipe you will ever need. Crispy, chewy, perfect.', tags: ['food', 'pizza', 'recipe'], timestamp: _ago(h: 36), likes: 3678, comments: 521, shares: 187, imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400'),
  ];

  static final List<AppNotification> notifications = [
    AppNotification(id: 'n1', from: users[0], type: 'like', message: 'liked your photo', timestamp: _ago(m: 5)),
    AppNotification(id: 'n2', from: users[4], type: 'follow', message: 'started following you', timestamp: _ago(m: 12)),
    AppNotification(id: 'n3', from: users[1], type: 'comment', message: 'commented: "Amazing work!"', timestamp: _ago(h: 1), isRead: true),
    AppNotification(id: 'n4', from: users[2], type: 'like', message: 'liked your post', timestamp: _ago(h: 2), isRead: true),
    AppNotification(id: 'n5', from: users[6], type: 'mention', message: 'mentioned you in a post', timestamp: _ago(h: 3)),
    AppNotification(id: 'n6', from: users[3], type: 'follow', message: 'started following you', timestamp: _ago(h: 5), isRead: true),
    AppNotification(id: 'n7', from: users[7], type: 'like', message: 'liked your story', timestamp: _ago(h: 7)),
    AppNotification(id: 'n8', from: users[5], type: 'comment', message: 'commented: "So inspiring!"', timestamp: _ago(h: 10), isRead: true),
  ];

  static List<Post> get suggestedPosts =>
      posts.where((p) => !p.isLiked).take(6).toList();
}
