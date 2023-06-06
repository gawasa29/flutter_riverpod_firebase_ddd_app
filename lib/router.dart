import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_in_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_up_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_list_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/tabbar.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/user_list_screen.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());
final shellNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: ref.watch(rootNavigatorKey),
    initialLocation: '/SignUp',
    routes: [
      GoRoute(
        path: '/SignUp',
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/SignIp',
        name: SignInScreen.routeName,
        builder: (context, state) => const SignInScreen(),
      ),
      ShellRoute(
        navigatorKey: ref.watch(shellNavigatorKey),
        builder: (context, state, child) => TabBarScreen(
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/UserList',
            name: UserListScreen.routeName,
            pageBuilder: (context, state) => _buildPageWithAnimation(
              const UserListScreen(),
            ),
          ),
          GoRoute(
            path: '/ChatRoomList',
            name: ChatRoomListScreen.routeName,
            pageBuilder: (context, state) => _buildPageWithAnimation(
              const ChatRoomListScreen(),
            ),
          ),
          GoRoute(
            path: '/Profile',
            name: ProfileScreen.routeName,
            pageBuilder: (context, state) => _buildPageWithAnimation(
              const ProfileScreen(),
            ),
          ),
        ],
      ),
    ],
  ),
);

CustomTransitionPage<void> _buildPageWithAnimation(Widget page) {
  return CustomTransitionPage<void>(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.easeIn),
            ),
          ),
          child: child,
        ),
      );
    },
  );
}
