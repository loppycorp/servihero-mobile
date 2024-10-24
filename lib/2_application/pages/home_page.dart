import 'package:flutter/material.dart';
import 'package:herohub_app/2_application/pages/messages/messages_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'home';
  static const path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MessagesPage());
  }
}
