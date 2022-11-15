import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinehouse_assignment/repository/screen-1-repo/list_entity.dart';

class Screen2Repo {
  static Stream<List<ListEntity>> getFormData() {
    final firebaseStore = FirebaseFirestore.instance;
    List<ListEntity> listEntity = [];
    return firebaseStore.collection("Forms").snapshots().map((event) {
      for (var element in event.docs) {
        listEntity.add(ListEntity.fromJson(element.data()));
      }
      return listEntity;
    });
  }
}
