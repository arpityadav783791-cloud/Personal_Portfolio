import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  UrlHelper._();

  static Future<bool> openUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      return await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      debugPrint('Error launching URL $url: $e');
      return false;
    }
  }

  static Future<bool> openEmail(String email, {String? subject}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: subject != null ? {'subject': subject} : null,
    );
    try {
      return await launchUrl(uri);
    } catch (e) {
      debugPrint('Error opening email client: $e');
      return false;
    }
  }

  static Future<bool> openPhone(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    try {
      return await launchUrl(uri);
    } catch (e) {
      debugPrint('Error opening dialer: $e');
      return false;
    }
  }
}
