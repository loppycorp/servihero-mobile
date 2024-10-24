import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:herohub_app/2_application/pages/home_page.dart';
import 'package:herohub_app/2_application/pages/login/view/login_page.dart';
import 'package:herohub_app/2_application/pages/messages/messages_page.dart';
import 'package:herohub_app/2_application/pages/messages_view/messages_view_page.dart';
import 'package:herohub_app/core/hive_helper.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

const String _basePath = '';

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '$_basePath/${HomePage.name}',
  routes: [
    GoRoute(
      name: LoginPage.name,
      path: LoginPage.path,
      builder: (context, state) {
        return const LoginPageWrapperProvider();
      },
    ),
    GoRoute(
      name: HomePage.name,
      path: HomePage.path,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      name: MessagesPage.name,
      path: MessagesPage.path,
      builder: (context, state) {
        return const MessagesPage();
      },
    ),
    GoRoute(
      name: MessagesViewPage.name,
      path: MessagesViewPage.path,
      builder: (context, state) {
        return const MessagesViewPage();
      },
    ),
  ],
  redirect: (context, state) async {
    final authLoginBox = await HiveHelper.getAuthLoginBox();
    if (authLoginBox == null || authLoginBox.isEmpty) {
      return LoginPage.path;
    }
    return null;
  },
);
