import 'package:flutter/services.dart';

import '../../../shared_models/theme.dart';
import "dart:convert";

Future<List<Map<String, dynamic>>> fetchQuestionsService(Theme theme) async {
  // Enum types force camel-case names.
  // The questions filenames are snake-case.
  // Physics Chemistry is the only theme with 2 words, hence this line of code.
  String themeName = theme.value == ThemeValue.physicsChemistry
      ? "physics_chemistry"
      : theme.value.name;
  final jsonString = await rootBundle.loadString(
    '../../shared_assets/questions/${themeName}_fr.json',
  );
  return (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();
}
