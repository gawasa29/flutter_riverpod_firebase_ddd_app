import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_list_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/user_list_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});
  static const routeName = 'TabBar';
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  var _navIndex = 0;

  late Widget _currentWidget;
  @override
  void initState() {
    _currentWidget = const UserListScreen();
    super.initState();
  }

//!数字で画面きりかえの仕組み
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _currentWidget = const UserListScreen();
      } else if (_selectedIndex == 1) {
        _currentWidget = const ChatRoomListScreen();
      } else if (_selectedIndex == 2) {
        _currentWidget = const ProfileScreen();
      } else {}
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
        onTap: (int index) {
          setState(
            () {
              HapticFeedback.mediumImpact();
              _navIndex = index;
              _onItemTapped(index);
            },
          );
        },
        currentIndex: _navIndex,
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(child: _currentWidget),
    );
  }
}
