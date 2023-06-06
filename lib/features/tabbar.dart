import 'package:flutter/material.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_list_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/user_list_screen.dart';
import 'package:go_router/go_router.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key, required this.child});

  final Widget child;
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.person_search), label: ''),
          NavigationDestination(icon: Icon(Icons.chat), label: ''),
          NavigationDestination(icon: Icon(Icons.account_circle), label: ''),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = 0;
              context.goNamed(UserListScreen.routeName);
              break;
            case 1:
              _selectedIndex = 1;
              context.goNamed(ChatRoomListScreen.routeName);
            case 2:
              _selectedIndex = 2;
              context.goNamed(ProfileScreen.routeName);
              break;
            default:
              _selectedIndex = 0;
              context.goNamed(UserListScreen.routeName);
          }
          setState(() {});
        },
      ),
      body: widget.child,
    );
  }
}
