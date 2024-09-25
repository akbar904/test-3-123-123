
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/models/animal_model.dart';

void main() {
	group('AnimalModel', () {
		test('should be instantiated with name and icon', () {
			final animal = AnimalModel(name: 'Cat', icon: Icons.pets);
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.pets);
		});

		test('should correctly serialize to JSON', () {
			final animal = AnimalModel(name: 'Dog', icon: Icons.person);
			final json = animal.toJson();
			expect(json['name'], 'Dog');
			expect(json['icon'], Icons.person.codePoint);
		});

		test('should correctly deserialize from JSON', () {
			final json = {'name': 'Cat', 'icon': Icons.pets.codePoint};
			final animal = AnimalModel.fromJson(json);
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.pets);
		});

		test('should throw an error if icon is not found during deserialization', () {
			final json = {'name': 'Cat', 'icon': 9999}; // Invalid icon code point
			expect(() => AnimalModel.fromJson(json), throwsException);
		});
	});
}

class AnimalModel {
	final String name;
	final IconData icon;

	AnimalModel({required this.name, required this.icon});

	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'icon': icon.codePoint,
		};
	}

	factory AnimalModel.fromJson(Map<String, dynamic> json) {
		return AnimalModel(
			name: json['name'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
