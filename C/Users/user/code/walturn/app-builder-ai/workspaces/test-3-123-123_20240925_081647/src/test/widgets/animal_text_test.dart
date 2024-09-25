
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/widgets/animal_text.dart';

void main() {
	group('AnimalText Widget', () {
		testWidgets('displays correct text and icon for cat', (WidgetTester tester) async {
			// Arrange
			const animalText = AnimalText(text: 'Cat', icon: Icons.access_time);

			// Act
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: animalText)));

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays correct text and icon for dog', (WidgetTester tester) async {
			// Arrange
			const animalText = AnimalText(text: 'Dog', icon: Icons.person);

			// Act
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: animalText)));

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('renders AnimalText widget', (WidgetTester tester) async {
			// Arrange
			const animalText = AnimalText(text: 'Sample', icon: Icons.pets);

			// Act
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: animalText)));

			// Assert
			expect(find.byType(AnimalText), findsOneWidget);
		});
	});
}
