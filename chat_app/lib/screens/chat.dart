import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

void setupPushNotifications() async {
  final fcm = FirebaseMessaging.instance;
  await fcm.requestPermission();

  fcm.subscribeToTopic('chat');
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: Column(
        children: const [Expanded(child: ChatMessages()), NewMessage()],
      ),
    );
  }
}
