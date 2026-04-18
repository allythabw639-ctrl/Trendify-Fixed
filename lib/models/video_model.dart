class VideoModel {
  final String id;
  final String url;
  final String username;
  final String description;
  final int likes;
  final int comments;
  final int shares;

  const VideoModel({
    required this.id,
    required this.url,
    required this.username,
    required this.description,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}

const List<VideoModel> sampleVideos = [
  VideoModel(
    id: '1',
    url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    username: '@nature_vibes',
    description: 'Big Buck Bunny - Classic animation! #animation #fun',
    likes: 12400,
    comments: 342,
    shares: 89,
  ),
  VideoModel(
    id: '2',
    url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    username: '@creative_studio',
    description: 'Elephants Dream - Open source short film #art #film',
    likes: 8700,
    comments: 215,
    shares: 56,
  ),
  VideoModel(
    id: '3',
    url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    username: '@trending_clips',
    description: 'Epic blazes compilation #trending #viral',
    likes: 34200,
    comments: 1023,
    shares: 456,
  ),
  VideoModel(
    id: '4',
    url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    username: '@adventure_time',
    description: 'Great escapes! #adventure #exciting',
    likes: 19800,
    comments: 567,
    shares: 234,
  ),
];
