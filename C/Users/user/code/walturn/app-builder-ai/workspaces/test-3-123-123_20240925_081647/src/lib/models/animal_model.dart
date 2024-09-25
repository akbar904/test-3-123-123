
import 'package:flutter/material.dart';

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
		final iconData = IconData(json['icon'], fontFamily: 'MaterialIcons');
		if (!Icons.codePointToIconData.containsValue(iconData)) {
			throw Exception('Icon not found');
		}
		return AnimalModel(
			name: json['name'],
			icon: iconData,
		);
	}
}
