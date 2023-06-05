import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_in_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/auth/presentation/sign_up_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/tabbar.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: ref.watch(navigatorKey),
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
      GoRoute(
        path: '/TabBar',
        name: TabBarScreen.routeName,
        builder: (context, state) => const TabBarScreen(),
      ),
    ],
  ),
);
