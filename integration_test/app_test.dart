import 'package:flutter/material.dart';
import 'package:flutter_riverpod_firebase_ddd_app/features/user/presentation/profile_screen.dart';
import 'package:flutter_riverpod_firebase_ddd_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  //おまじない
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('start', (WidgetTester tester) async {
      app.main();
      //ここからテスト
      //アニメーションなどを待つ描画されなくなるまでtestの実行を待つ。
      await tester.pumpAndSettle();
      // フォームに記入する。
      await tester.enterText(
          find.widgetWithText(TextFormField, 'メールアドレス'), 'test@test.com');
      await tester.enterText(
          find.widgetWithText(TextFormField, '名前'), 'Test User');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'), 'test123');
      // SignUp ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'SignUp'));
      await tester.pumpAndSettle();

      // ProfileScreenに移動していることを確認します。
      expect(find.byType(ProfileScreen), findsOneWidget);
      // Delete ボタンをタップします。
      await tester.tap(find.widgetWithText(ElevatedButton, 'Delete'));
    });
  });
}
