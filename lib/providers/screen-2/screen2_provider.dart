import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pinehouse_assignment/repository/screen-1-repo/list_entity.dart';
import 'package:pinehouse_assignment/repository/screen-2-repo/screen2_repo.dart';

class Screen2Provider extends ChangeNotifier {
  List<ListEntity> listEntity = [];

  getFormData() async {
    Screen2Repo.getFormData().listen((event) {
      listEntity = event;
      log(listEntity.first.name);
      notifyListeners();
    });
  }
}
