import '../models/post_model.dart';

class MockData {
  MockData._();

  static final CircloUser selfUser = CircloUser(
    id: 'self', username: 'you', displayName: 'Jordan Circlo',
    avatar: '🌸', followers: 842, following: 319, postCount: 47,
    bio: 'Living, laughing, creating ✨ | Flutter dev by day',
  );

  static final List<CircloUser> users = [
    CircloUser(id: 'u1', username: 'nova_art', displayName: 'Nova Art', avatar: '🎨', followers: 12400, following: 312, postCount: 203, bio: 'Digital artist & dreamer 🎨', isFollowing: true),
    CircloUser(id: 'u2', username: 'fitjordan', displayName: 'Jordan Fit', avatar: '💪', followers: 5800, following: 201, postCount: 89, bio: 'Fitness coach | Eat well, move daily 🏋️', isFollowing: true),
    CircloUser(id: 'u3', username: 'chef_mia', displayName: 'Mia Cooks', avatar: '👩‍🍳', followers: 38200, following: 145, postCount: 451, bio: 'Food is love 🍳 | Recipe creator', isFollowing: false),
    CircloUser(id: 'u4', username: 'techwave', displayName: 'Tech Wave', avatar: '💻', followers: 21000, following: 89, postCount: 312, bio: 'Tech trends, tools & tips 🚀'),
    CircloUser(id: 'u5', username: 'travel.ada', displayName: 'Ada Travels', avatar: '✈️', followers: 67500, following: 502, postCount: 670, bio: 'Exploring the world one city at a time 🌍', isFollowing: true),
    CircloUser(id: 'u6', username: 'mindfulgrace', displayName: 'Grace Mind', avatar: '🧘', followers: 9200, following: 430, postCount: 128, bio: 'Mindfulness & wellness advocate 🌿', isFollowing: false),
    CircloUser(id: 'u7', username: 'leo_photo', displayName: 'Leo Shots', avatar: '📸', followers: 44100, following: 672, postCount: 890, bio: 'Photographer | Capturing moments', isFollowing: true),
    CircloUser(id: 'u8', username: 'bookworm_sam', displayName: 'Sam Reads', avatar: '📚', followers: 7800, following: 290, postCount: 156, bio: 'Books, coffee, repeat ☕', isFollowing: false),
  ];

  static DateTime _ago({int h = 0, int m = 0}) => DateTime.now().subtract(Duration(hours: h, minutes: m));

  static final List<Post> posts = [
    Post(id: 'p1', author: users[0], emoji: '🎨', content: 'Just finished my latest digital painting! This one took 3 weeks but worth every hour. What do you think? 🖌️✨', tags: ['art', 'digital', 'creative'], timestamp: _ago(m: 15), likes: 1240, comments: 84, shares: 32),
    Post(id: 'p2', author: users[4], emoji: '🏯', content: 'Kyoto in the morning mist is absolutely breathtaking. Woke up at 4am just for this view and zero regrets 🌸', tags: ['travel', 'japan', 'kyoto'], timestamp: _ago(h: 1), likes: 4521, comments: 203, shares: 167),
    Post(id: 'p3', author: users[1], emoji: '💪', content: 'New PR on deadlifts today! 180kg. Consistency is everything — 3 years of showing up every single day. Your future self will thank you 🏋️‍♂️', tags: ['fitness', 'gym', 'motivation'], timestamp: _ago(h: 2, m: 30), likes: 892, comments: 67, shares: 43, isLiked: true),
    Post(id: 'p4', author: users[2], emoji: '🍝', content: 'Homemade carbonara from scratch — no cream, just eggs, pecorino and guanciale. Nonna would approve 😄 Recipe in comments!', tags: ['food', 'pasta', 'cooking'], timestamp: _ago(h: 4), likes: 2108, comments: 312, shares: 98),
    Post(id: 'p5', author: users[6], emoji: '🌅', content: 'Golden hour over the ocean. No filter needed when nature does the work 🌊📸 This is why I love photography.', tags: ['photography', 'sunset', 'ocean'], timestamp: _ago(h: 5), likes: 3340, comments: 128, shares: 204, isLiked: true),
    Post(id: 'p6', author: users[3], emoji: '🚀', content: 'Flutter 4.0 announced! App development is about to change completely. Thread of the best new features below 👇 #flutter #dev', tags: ['tech', 'flutter', 'dev'], timestamp: _ago(h: 6), likes: 1567, comments: 245, shares: 432),
    Post(id: 'p7', author: users[5], emoji: '🧘', content: 'Morning meditation changed my life. Just 10 minutes a day for 6 months and my anxiety is completely different. Start small. 🌿', tags: ['mindfulness', 'wellness', 'meditation'], timestamp: _ago(h: 8), likes: 967, comments: 89, shares: 234, isSaved: true),
    Post(id: 'p8', author: users[7], emoji: '📚', content: 'Finished "Thinking Fast and Slow" and my mind is officially blown 🤯 Kahneman is a genius. Who else has read this? Top shelf recommendation!', tags: ['books', 'reading', 'psychology'], timestamp: _ago(h: 12), likes: 432, comments: 76, shares: 54),
    Post(id: 'p9', author: users[0], emoji: '🌈', content: 'Color theory is my obsession recently. Every hue tells a story. Which palette speaks to you? 1️⃣ Warm sunset or 2️⃣ Cool ocean 💙', tags: ['art', 'colortheory', 'creative'], timestamp: _ago(h: 18), likes: 2890, comments: 441, shares: 89, isLiked: true),
    Post(id: 'p10', author: users[4], emoji: '🗼', content: 'Paris at 2am hits differently. The city is alive in a completely unique way when the tourists are asleep 🌙✨', tags: ['travel', 'paris', 'night'], timestamp: _ago(h: 22), likes: 5213, comments: 312, shares: 278),
    Post(id: 'p11', author: users[1], emoji: '🥗', content: 'Meal prep Sunday! 5 days of healthy eating ready to go. Macros calculated, goals locked in. Who else meal preps? 🥙', tags: ['fitness', 'nutrition', 'mealprep'], timestamp: _ago(h: 28), likes: 1124, comments: 94, shares: 67),
    Post(id: 'p12', author: users[2], emoji: '🍕', content: '72-hour cold ferment pizza dough. This is the only recipe you will ever need. Crispy, chewy, perfect 🍕🔥', tags: ['food', 'pizza', 'recipe'], timestamp: _ago(h: 36), likes: 3678, comments: 521, shares: 187),
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

  static List<Post> get suggestedPosts => posts.where((p) => !p.isLiked).take(6).toList();
}
