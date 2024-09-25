
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/main.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('MainApp', () {
		testWidgets('should render HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('HomeScreen', () {
		testWidgets('should display Cat with clock icon initially', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => AnimalCubit(),
						child: HomeScreen(),
					),
				),
			);
			
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('should display Dog with person icon when tapped', (WidgetTester tester) async {
			final mockAnimalCubit = MockAnimalCubit();

			whenListen(mockAnimalCubit, Stream.fromIterable([AnimalCat(), AnimalDog()]), initialState: AnimalCat());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
