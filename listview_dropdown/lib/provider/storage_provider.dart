import 'package:flutter/material.dart';

class StorageProvider with ChangeNotifier {
  //
  List _skillQualities = [];
  List get skillsQualities => _skillQualities;
  void addSkillsQualities(skillsQualities) {
    _skillQualities.add(skillsQualities);
    ChangeNotifier();
  }

  List _developskillQualities = [];
  List get developskillsQualities => _developskillQualities;
  void addDevelopaddSkillsQualities(developskillsQualities) {
    _developskillQualities.add(developskillsQualities);
    ChangeNotifier();
  }
  //
}
