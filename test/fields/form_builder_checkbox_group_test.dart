import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'form_builder_tester.dart';

void main() {
  testWidgets('FormBuilderCheckboxGroup -- 1,3', (WidgetTester tester) async {
    const widgetName = 'cbg1';
    final testWidget = FormBuilderCheckboxGroup<int>(
      name: widgetName,
      options: const [
        FormBuilderFieldOption(key: ValueKey('1'), value: 1),
        FormBuilderFieldOption(key: ValueKey('2'), value: 2),
        FormBuilderFieldOption(key: ValueKey('3'), value: 3),
      ],
    );
    await tester.pumpWidget(buildTestableFieldWidget(testWidget));

    expect(formSave(), isTrue);
    expect(formValue(widgetName), isNull);
    await tester.tap(find.byKey(ValueKey('1')));
    await tester.pumpAndSettle();
    expect(formSave(), isTrue);
    expect(formValue(widgetName), equals(const [1]));
    await tester.tap(find.byKey(ValueKey('3')));
    await tester.pumpAndSettle();
    expect(formSave(), isTrue);
    expect(formValue(widgetName), equals(const [1, 3]));
  });
}
