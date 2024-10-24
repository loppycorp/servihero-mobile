import 'package:flutter/material.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class MessagesViewPage extends StatefulWidget {
  const MessagesViewPage({super.key});

  static const name = 'messagesViewPage';
  static const path = '/messagesViewPage';

  @override
  State<MessagesViewPage> createState() => _MessagesViewPageState();
}

class _MessagesViewPageState extends State<MessagesViewPage> {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Messages View'),
          centerTitle: true,
           iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: const Center(
          child: Text('Chat View'),
        )
        // InfiniteList(
        //   itemCount: _items.length,
        //   isLoading: _isLoading,
        //   onFetchData: _fetchData,
        //   separatorBuilder: (context, index) => const Divider(),
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       leading: Stack(
        //         children: [
        //           const CircleAvatar(
        //             radius: 30,
        //             // backgroundImage: AssetImage(
        //             //     'your_image.png'), // Replace with your image path
        //             backgroundColor: Color(0xffe9a925),
        //           ),
        //           Positioned(
        //             bottom: 0,
        //             right: 0,
        //             child: Container(
        //               padding: const EdgeInsets.all(4),
        //               decoration: const BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: Colors.red, // Customize the color
        //               ),
        //               child: const Text(
        //                 '10', // Replace with your subcount value
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 12,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       dense: true,
        //       title: Text(
        //         _items[index],
        //         style: const TextStyle(fontWeight: FontWeight.w600),
        //       ),
        //       subtitle: const Text(
        //           'subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle'),
        //     );
        //   },
        // ),
        );
  }
}
