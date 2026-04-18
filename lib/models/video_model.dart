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
];
