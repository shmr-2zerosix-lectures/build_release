import 'package:flutter_test/flutter_test.dart';
import 'package:build_release/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  testWidgets('screenshot', (WidgetTester tester) async {
    // Build the app.
    await tester.pumpWidget(const app.MyApp());

    // This is required prior to taking the screenshot (Android only).
    await binding.convertFlutterSurfaceToImage();

    // Trigger a frame.
    await tester.pumpAndSettle();
    await binding.takeScreenshot('screenshot-1');

    final f = Future.delayed(const Duration(seconds: 10), () => false);
    while (await f.timeout(Duration.zero, onTimeout: () => true)) {
      await tester.pump();
    }
  });
}
