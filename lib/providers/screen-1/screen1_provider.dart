import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinehouse_assignment/repository/screen-1-repo/screen1_repo.dart';

enum Screen1State { normal, loading, succeed }

class Screen1Provider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  Screen1State screen1state = Screen1State.normal;
  //initial values
  String selectedDepartment = 'HR';
  final List<String> department = [
    "HR",
    "Finance",
    "Housekeeping",
    "Marketing"
  ];
  void setDepartment(value) {
    selectedDepartment = value;
    notifyListeners();
  }

  File? image;
  final picker = ImagePicker();

  ///Getting Image from camera
  selectImageFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      log('No Image Selected');
    }
    notifyListeners();
  }

  ///Getting image from gallery
  selectImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      log('No Image Selected');
    }
    notifyListeners();
  }

  ///Function to data data in Screen 1 repo function which will upload the data in FB
  uploadFormData() async {
    screen1state = Screen1State.loading;
    notifyListeners();
    await Screen1Repo.uploadFormData(
      image!,
      nameController.text,
      phoneNumberController.text,
      ageController.text,
      selectedDepartment,
    );
    screen1state = Screen1State.succeed;
    notifyListeners();
  }
}
