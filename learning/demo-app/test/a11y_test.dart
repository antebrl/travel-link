import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ri_go_demo/main.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/data/people_repository.dart';
import 'package:ri_go_demo/src/utils/logger.dart';

import 'fake_repository.dart';

// see https://raw.githubusercontent.com/flutter/codelabs/main/namer/step_08/test/a11y_test.dart
void main() {
  testWidgets('Follows a11y guidelines for start screen',
      (WidgetTester tester) async {
    logger.d('test with provider, as they are');
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await _testA11y(tester);
    handle.dispose();
  });

  testWidgets('Click edit person and check a11y guidelines',
      (WidgetTester tester) async {
    logger.d('test with fakeRepository');
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          peopleRepositoryProvider.overrideWithValue(FakeRepository()),
        ],
        child: const MyApp(),
      ),
    );
    // The first frame is a loading state.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Re-render.
    await tester.pump();

    // No longer loading
    expect(find.byType(CircularProgressIndicator), findsNothing);
    final editIconButtonFinder = find.byIcon(Icons.edit);
    // repository holds 2 items, hence expect 2 edit icons
    expect(editIconButtonFinder, findsNWidgets(2));
    await tester.press(editIconButtonFinder.first);
    await tester.pump();

    //test form widget for a11y
    await _testA11y(tester);

    handle.dispose();
  });
}

Future<void> _testA11y(WidgetTester tester) async {
  // Checks that tappable nodes have a minimum size of 48 by 48 pixels
  // for Android.
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

  // Checks that tappable nodes have a minimum size of 44 by 44 pixels
  // for iOS.
  await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));

  // Checks that touch targets with a tap or long press action are labeled.
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

  // Checks whether semantic nodes meet the minimum text contrast levels.
  // The recommended text contrast is 3:1 for larger text
  // (18 point and above regular).
  await expectLater(tester, meetsGuideline(textContrastGuideline));

  // @see https://github.com/rrousselGit/riverpod/issues/1941
  await tester.pumpWidget(Container());
  await tester.pumpAndSettle();
}
