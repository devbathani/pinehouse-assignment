import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pinehouse_assignment/repository/screen-1-repo/list_entity.dart';

class Screen1Repo {
  static Future uploadFormData(
    File image,
    String name,
    String phoneNumber,
    String age,
    String department,
  ) async {
    final storage = FirebaseStorage.instance;
    ListEntity listEntity;
    final imgName = DateTime.now().millisecondsSinceEpoch;
    final ref = await storage.ref('profile/$imgName').putFile(image);
    String imgUrl = await storage.ref('profile/$imgName').getDownloadURL();
    log(imgUrl);

    final firebaseFireStore = FirebaseFirestore.instance;
    listEntity = ListEntity(
      name: name,
      phoneNumber: phoneNumber,
      age: age,
      department: department,
      imgUrl: imgUrl,
    );

    ///This function will be uploadind the entered data of screen 1 on FB
    await firebaseFireStore
        .collection('Forms')
        .doc(name)
        .set(listEntity.toJson())
        .whenComplete(
          () => log("Uploaded Successfull"),
        );
  }
}
