
import 'package:flutter_bloc/flutter_bloc.dart';
import 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalInitial());

	void switchAnimal() {
		if (state is AnimalInitial || state is AnimalDog) {
			emit(AnimalCat());
		} else if (state is AnimalCat) {
			emit(AnimalDog());
		}
	}
}
