import 'package:flutter/material.dart';
import '../../utils/trendify_theme.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

  static const _trendingTags = [
    _TagData(tag: '#trendify', posts: '2.4M', icon: Icons.local_fire_department),
    _TagData(tag: '#anime_style', posts: '1.8M', icon: Icons.brush),
    _TagData(tag: '#sketch_art', posts: '1.2M', icon: Icons.edit),
    _TagData(tag: '#oil_painting', posts: '890K', icon: Icons.palette),
    _TagData(tag: '#watercolor', posts: '670K', icon: Icons.water_drop),
    _TagData(tag: '#pop_art', posts: '540K', icon: Icons.color_lens),
    _TagData(tag: '#fyp', posts: '12.1M', icon: Icons.trending_up),
    _TagData(tag: '#AI_filter', posts: '3.1M', icon: Icons.auto_awesome),
  ];

  static const _categories = [
    _CategoryData(name: 'Trending', emoji: '\u{1F525}', color: Color(0xFFFF6B6B)),
    _CategoryData(name: 'Art', emoji: '\u{1F3A8}', color: Color(0xFFCC65FE)),
    _CategoryData(name: 'Comedy', emoji: '\u{1F602}', color: Color(0xFFFECA57)),
    _CategoryData(name: 'Music', emoji: '\u{1F3B5}', color: Color(0xFF48DBFB)),
    _CategoryData(name: 'Dance', emoji: '\u{1F57A}', color: Color(0xFFFF9FF3)),
    _CategoryData(name: 'Food', emoji: '\u{1F355}', color: Color(0xFFFFA502)),
    _CategoryData(name: 'Travel', emoji: '\u{2708}\u{FE0F}', color: Color(0xFF1DD1A1)),
    _CategoryData(name: 'Fashion', emoji: '\u{1F457}', color: Color(0xFFFF6348)),
    _CategoryData(name: 'Pets', emoji: '\u{1F436}', color: Color(0xFFA29BFE)),
    _CategoryData(name: 'Sports', emoji: '\u{26BD}', color: Color(0xFF2ED573)),
  ];

  static const _creators = [
    _CreatorData(name: 'sara_art', handle: '@sara_art', followers: '1.2M'),
    _CreatorData(name: 'mo_creates', handle: '@mo_creates', followers: '890K'),
    _CreatorData(name: 'lina.fx', handle: '@lina.fx', followers: '2.1M'),
    _CreatorData(name: 'ali_style', handle: '@ali_style', followers: '560K'),
    _CreatorData(name: 'huda.ai', handle: '@huda.ai', followers: '3.4M'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white38),
                      prefixIcon: Icon(Icons.search, color: Colors.white38, size: 22),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    return Container(
                      width: 76,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: cat.color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: cat.color.withOpacity(0.3)),
                            ),
                            child: Center(
                              child: Text(cat.emoji, style: const TextStyle(fontSize: 24)),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            cat.name,
                            style: const TextStyle(color: Colors.white70, fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Text(
                  'Trending Tags',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final tag = _trendingTags[index];
                  return ListTile(
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(tag.icon, color: Colors.pinkAccent, size: 22),
                    ),
                    title: Text(
                      tag.tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      '${tag.posts} posts',
                      style: const TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: TrendifyBrand.logoGradient,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'View',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  );
                },
                childCount: _trendingTags.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Text(
                  'Suggested Creators',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _creators.length,
                  itemBuilder: (context, index) {
                    final creator = _creators[index];
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey[800],
                            child: Text(
                              creator.name[0].toUpperCase(),
                              style: const TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            creator.handle,
                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${creator.followers} followers',
                            style: const TextStyle(color: Colors.white38, fontSize: 11),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.pinkAccent.withOpacity(0.6)),
                            ),
                            child: const Text(
                              'Follow',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.pinkAccent, fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}

class _TagData {
  final String tag;
  final String posts;
  final IconData icon;

  const _TagData({required this.tag, required this.posts, required this.icon});
}

class _CategoryData {
  final String name;
  final String emoji;
  final Color color;

  const _CategoryData({required this.name, required this.emoji, required this.color});
}

class _CreatorData {
  final String name;
  final String handle;
  final String followers;

  const _CreatorData({required this.name, required this.handle, required this.followers});
}
