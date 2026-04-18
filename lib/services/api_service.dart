import 'dart:convert';
import '../models/video_model.dart';
import '../models/user_model.dart';
import '../models/style_filter_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.trendify.sh/v1';

  static Future<List<VideoModel>> getFeed() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return sampleVideos;
  }

  static Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email.contains('test')) {
      return UserModel(id: '1', username: 'tester', email: email);
    }
    return null;
  }
}
