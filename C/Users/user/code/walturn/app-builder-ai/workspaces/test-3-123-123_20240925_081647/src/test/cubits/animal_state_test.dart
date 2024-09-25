
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/cubits/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalState {}

void main() {
	group('AnimalState', () {
		test('AnimalInitial is a type of AnimalState', () {
			expect(AnimalInitial(), isA<AnimalState>());
		});
		
		test('AnimalCat is a type of AnimalState', () {
			expect(AnimalCat(), isA<AnimalState>());
		});
		
		test('AnimalDog is a type of AnimalState', () {
			expect(AnimalDog(), isA<AnimalState>());
		});
	});
}
