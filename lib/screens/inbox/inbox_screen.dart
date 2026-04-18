import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static final _notifications = [
    _NotificationItem(avatar: 'S', username: 'sara_art', action: 'liked your video', time: '2m ago', type: _NType.like),
    _NotificationItem(avatar: 'M', username: 'mo_creates', action: 'started following you', time: '15m ago', type: _NType.follow),
    _NotificationItem(avatar: 'L', username: 'lina.fx', action: 'commented: "This filter is amazing!"', time: '1h ago', type: _NType.comment),
    _NotificationItem(avatar: 'A', username: 'ali_style', action: 'used your Anime filter on their video', time: '2h ago', type: _NType.mention),
    _NotificationItem(avatar: 'N', username: 'nora_trend', action: 'liked your video', time: '3h ago', type: _NType.like),
    _NotificationItem(avatar: 'Z', username: 'zaid_film', action: 'shared your video', time: '4h ago', type: _NType.share),
    _NotificationItem(avatar: 'H', username: 'huda.ai', action: 'commented: "How did you get that effect??"', time: '5h ago', type: _NType.comment),
    _NotificationItem(avatar: 'O', username: 'omar_vfx', action: 'started following you', time: '6h ago', type: _NType.follow),
    _NotificationItem(avatar: 'D', username: 'dina_edits', action: 'liked your video', time: '8h ago', type: _NType.like),
    _NotificationItem(avatar: 'R', username: 'rami_cam', action: 'mentioned you in a comment', time: '12h ago', type: _NType.mention),
    _NotificationItem(avatar: 'K', username: 'khaled_v', action: 'liked your video', time: '1d ago', type: _NType.like),
    _NotificationItem(avatar: 'Y', username: 'yusuf_fx', action: 'started following you', time: '1d ago', type: _NType.follow),
  ];

  static final _messages = [
    _MessageItem(avatar: 'S', username: 'sara_art', lastMessage: 'Hey! Loved your last video', time: '5m ago', unread: true),
    _MessageItem(avatar: 'M', username: 'mo_creates', lastMessage: 'Want to collab on a duet?', time: '1h ago', unread: true),
    _MessageItem(avatar: 'L', username: 'lina.fx', lastMessage: 'Which filter did you use?', time: '3h ago', unread: false),
    _MessageItem(avatar: 'H', username: 'huda.ai', lastMessage: 'Thanks for the follow back!', time: '1d ago', unread: false),
    _MessageItem(avatar: 'Z', username: 'zaid_film', lastMessage: 'Check out this new style I made', time: '2d ago', unread: false),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Inbox', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white38,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          tabs: [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Activity'),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8)),
                    child: Text('${_notifications.length}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Messages'),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8)),
                    child: Text('${_messages.where((m) => m.unread).length}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActivityTab(),
          _buildMessagesTab(),
        ],
      ),
    );
  }

  Widget _buildActivityTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        final n = _notifications[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[800],
            child: Text(n.avatar, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: n.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                TextSpan(text: ' ${n.action}', style: const TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          subtitle: Text(n.time, style: const TextStyle(color: Colors.white30, fontSize: 12)),
          trailing: _buildTrailingForType(n.type),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        );
      },
    );
  }

  Widget _buildTrailingForType(_NType type) {
    switch (type) {
      case _NType.like:
        return const Icon(Icons.favorite, color: Colors.pinkAccent, size: 20);
      case _NType.follow:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pinkAccent.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text('Follow back', style: TextStyle(color: Colors.pinkAccent, fontSize: 12, fontWeight: FontWeight.w600)),
        );
      case _NType.comment:
        return const Icon(Icons.chat_bubble_outline, color: Colors.white38, size: 20);
      case _NType.share:
        return const Icon(Icons.share_outlined, color: Colors.cyanAccent, size: 20);
      case _NType.mention:
        return const Icon(Icons.alternate_email, color: Colors.cyanAccent, size: 20);
    }
  }

  Widget _buildMessagesTab() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final m = _messages[index];
        return ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey[800],
                child: Text(m.avatar, style: const TextStyle(color: Colors.white, fontSize: 18)),
              ),
              if (m.unread)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            m.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: m.unread ? FontWeight.bold : FontWeight.w500,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            m.lastMessage,
            style: TextStyle(color: m.unread ? Colors.white70 : Colors.white38, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(m.time, style: TextStyle(color: m.unread ? Colors.pinkAccent : Colors.white30, fontSize: 11)),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        );
      },
    );
  }
}

enum _NType { like, follow, comment, share, mention }

class _NotificationItem {
  final String avatar;
  final String username;
  final String action;
  final String time;
  final _NType type;

  _NotificationItem({required this.avatar, required this.username, required this.action, required this.time, required this.type});
}

class _MessageItem {
  final String avatar;
  final String username;
  final String lastMessage;
  final String time;
  final bool unread;

  _MessageItem({required this.avatar, required this.username, required this.lastMessage, required this.time, required this.unread});
}
