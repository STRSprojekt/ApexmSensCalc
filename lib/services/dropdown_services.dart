import 'package:apexmsenscalc/models/dropdown_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DropdownService extends GetxService {
  final dropdownRef = FirebaseFirestore.instance
      .collection("calculation")
      .doc("smartphone")
      .collection("lists")
      .orderBy("fov", descending: false)
      .withConverter<FovModel>(
        fromFirestore: FovModel.fromFirestore,
        toFirestore: (FovModel fovmodel, _) => fovmodel.toFirestore(),
      );

  Future<List<FovModel>> getDropdownFov() async {
    var querySnapshot = await dropdownRef.get();
    var dropdownItemList = querySnapshot.docs.map((doc) => doc.data()).toList();
    return dropdownItemList;
  }
}
