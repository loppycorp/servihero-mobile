import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:herohub_app/2_application/pages/login/view/login_page.dart';
import 'package:herohub_app/2_application/pages/messages_view/messages_view_page.dart';
import 'package:herohub_app/core/hive_helper.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  static const name = 'messages';
  static const path = '/messages';

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  var _items = <String>[];
  var _isLoading = false;

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
      _items = List.generate(_items.length + 10, (i) => 'Item $i');
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color(0xff404040),
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mark_chat_unread_outlined,
                  color: Color(0xff404040),
                )),
            IconButton(
                onPressed: () {
                  HiveHelper.closeAuthLoginBox();
                  context.pushReplacementNamed(LoginPage.name);
                },
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Color(0xff404040),
                ))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(icon: Icon(Icons.phone)),
              Tab(icon: Icon(Icons.person_rounded)),
              Tab(icon: Icon(Icons.groups_outlined)),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffe87723),
            indicatorWeight: 4,
          ),
        ),
        body: InfiniteList(
          itemCount: _items.length,
          isLoading: _isLoading,
          onFetchData: _fetchData,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return MessageTile(
              unreadCount: index,
              titleText: _items[index],
              subtitleText:
                  'subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle',
            );
          },
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  const MessageTile(
      {super.key,
      required this.unreadCount,
      required this.titleText,
      required this.subtitleText});
  final int unreadCount;
  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pushNamed(MessagesViewPage.name);
      },
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 30,
            // backgroundImage: AssetImage(
            //     'your_image.png'), // Replace with your image path
            backgroundColor: Color(0xffeaa422),
          ),
          if (unreadCount > 0) ...[
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: const Color(0xffe9534a),
                radius: 10,
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
      dense: true,
      title: Text(
        titleText,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitleText),
    );
  }
}
