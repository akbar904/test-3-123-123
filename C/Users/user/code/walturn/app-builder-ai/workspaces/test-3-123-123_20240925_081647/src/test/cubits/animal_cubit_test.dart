
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/cubits/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalInitial', () {
			expect(animalCubit.state, AnimalInitial());
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalCat] when switchAnimal is called from initial state',
			build: () => animalCubit,
			act: (cubit) => cubit.switchAnimal(),
			expect: () => [isA<AnimalCat>()],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalDog] when switchAnimal is called from AnimalCat state',
			build: () => animalCubit,
			seed: () => AnimalCat(),
			act: (cubit) => cubit.switchAnimal(),
			expect: () => [isA<AnimalDog>()],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalCat] when switchAnimal is called from AnimalDog state',
			build: () => animalCubit,
			seed: () => AnimalDog(),
			act: (cubit) => cubit.switchAnimal(),
			expect: () => [isA<AnimalCat>()],
		);
	});
}
