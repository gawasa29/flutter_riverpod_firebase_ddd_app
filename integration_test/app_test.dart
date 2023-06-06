import 'package:flutter/material.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/chat/presentation/chat_room_list_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/user_list_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  //おまじない
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('start', (WidgetTester tester) async {
      app.main();
      // 変数定義
      const email = 'test1@test.com';
      const name = 'Test User';
      const password = 'test123';
      //ここからテスト
      //アニメーションなどを待つ描画されなくなるまでtestの実行を待つ。
      await tester.pumpAndSettle();
      // フォームに記入する。
      await tester.enterText(
          find.widgetWithText(TextFormField, 'メールアドレス'), email);
      await tester.enterText(find.widgetWithText(TextFormField, '名前'), name);
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), password);
      // SignUp ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'SignUp'));
      await tester.pumpAndSettle();

      // UserListScreen に移動していることを確認します。
      expect(find.byType(UserListScreen), findsOneWidget);

      // BottomNavigationBarのchatIcon ボタンをタップします。
      await tester.tap(find.byIcon(Icons.chat));
      await tester.pumpAndSettle();

      // ChatRoomListScreen に移動していることを確認します。
      expect(find.byType(ChatRoomListScreen), findsOneWidget);

      // BottomNavigationBarのaccount_circle ボタンをタップします。
      await tester.tap(find.byIcon(Icons.account_circle));
      await tester.pumpAndSettle();

      // ProfileScreen に移動していることを確認します。
      expect(find.byType(ProfileScreen), findsOneWidget);

      // logout ボタンをタップします。
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();

      // go to SignIn ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'go to SignIn'));
      await tester.pumpAndSettle();

      // フォームに記入する。
      await tester.enterText(
          find.widgetWithText(TextFormField, 'メールアドレス'), email);
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), password);
      // SignIn ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'SignIn'));
      await tester.pumpAndSettle();

      // UserListScreen に移動していることを確認します。
      expect(find.byType(UserListScreen), findsOneWidget);

      // BottomNavigationBarのaccount_circle ボタンをタップします。
      await tester.tap(find.byIcon(Icons.account_circle));
      await tester.pumpAndSettle();

      // Delete ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'Delete'));
    });
  });
}
