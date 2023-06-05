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
    });
  });
}
