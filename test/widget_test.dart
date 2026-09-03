import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/core/constants/portfolio_constants.dart';

void main() {
  testWidgets('Portfolio loads successfully smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text(PortfolioConstants.shortName.toUpperCase()), findsWidgets);
    expect(find.text(PortfolioConstants.heroGreeting), findsOneWidget);
    expect(find.text('View Projects'), findsOneWidget);
  });
}
