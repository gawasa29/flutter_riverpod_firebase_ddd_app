import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/application/user_application.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/domain/user_entity.dart';
import 'package:go_router/go_router.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});
  static const routeName = 'UserList';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: ref.watch(userListQueryProvider).when(
            data: (userList) {
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) =>
                    UserList(user: userList[index]),
              );
            },
            error: (err, stack) => Text('Error $err'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        trailing: IconButton(
          icon: const Icon(Icons.person_add),
          onPressed: () {
            context.goNamed(
              ChatRoomScreen.routeName,
              pathParameters: <String, String>{'userId': user.userId},
            );
          },
        ),
      ),
    );
  }
}
