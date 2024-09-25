
import 'package:flutter/material.dart';

class AnimalText extends StatelessWidget {
	final String text;
	final IconData icon;

	const AnimalText({required this.text, required this.icon, Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				Text(text),
				Icon(icon),
			],
		);
	}
}
