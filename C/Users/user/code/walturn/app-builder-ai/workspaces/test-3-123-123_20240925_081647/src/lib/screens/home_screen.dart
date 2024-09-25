
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.animalswitcher/cubits/animal_cubit.dart';
import 'package:com.example.animalswitcher/widgets/animal_text.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Switcher'),
			),
			body: Center(
				child: BlocProvider(
					create: (_) => AnimalCubit(),
					child: BlocBuilder<AnimalCubit, AnimalState>(
						builder: (context, state) {
							String text;
							IconData icon;

							if (state is AnimalCat) {
								text = 'Cat';
								icon = Icons.access_time;
							} else if (state is AnimalDog) {
								text = 'Dog';
								icon = Icons.person;
							} else {
								text = 'Cat';
								icon = Icons.access_time;
							}

							return GestureDetector(
								onTap: () => context.read<AnimalCubit>().switchAnimal(),
								child: AnimalText(
									text: text,
									icon: icon,
								),
							);
						},
					),
				),
			),
		);
	}
}
