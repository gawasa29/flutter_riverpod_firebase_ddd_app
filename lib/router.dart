import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_in_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_up_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_list_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_screen.dart';
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
              pageBuilder: (context, state) => const NoTransitionPage(
                    child: UserListScreen(),
                  ),
              routes: [
                GoRoute(
                  parentNavigatorKey: ref.watch(rootNavigatorKey),
                  path: 'ChatRoom/:userId',
                  name: ChatRoomScreen.routeName,
                  builder: (context, state) {
                    final userId = state.pathParameters['userId']!;
                    return ChatRoomScreen(userId: userId);
                  },
                )
              ]),
          GoRoute(
            path: '/ChatRoomList',
            name: ChatRoomListScreen.routeName,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ChatRoomListScreen(),
            ),
          ),
          GoRoute(
            path: '/Profile',
            name: ProfileScreen.routeName,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
    ],
  ),
);
