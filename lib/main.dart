import 'package:flutter/material.dart';

import 'core/network/api_client.dart';
import 'features/auth/data/auth_api.dart';
import 'features/chat/junhyuk_chat_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final token = await AuthApi().login(
      email: 'admin@talkto.dev',
      password: 'admin@talkto',
    );

    ApiClient.setToken(token);
    debugPrint('LOGIN SUCCESS');
  } catch (e) {
    debugPrint('LOGIN ERROR: $e');
  }

  runApp(const TalkToApp());
}

class TalkToApp extends StatelessWidget {
  const TalkToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JunhyukChatPage(),
    );
  }
}
