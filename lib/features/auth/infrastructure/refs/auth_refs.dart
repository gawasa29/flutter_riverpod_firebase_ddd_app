import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRef = FirebaseAuth.instance;

final authUserProvider = StreamProvider<User?>(
  (ref) => authRef.userChanges(),
);

final userIdAsyncValueProvider = Provider<AsyncValue<String?>>(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);
