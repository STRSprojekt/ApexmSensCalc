import 'package:cloud_firestore/cloud_firestore.dart';

class FovModel {
  final int? fov;
  final List<num>? degreelist;

  FovModel({
    this.fov,
    this.degreelist,
  });

  factory FovModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FovModel(
      fov: data?['fov'],
      degreelist: data?['degreelist'] is Iterable
          ? List.from(data?['degreelist'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (fov != null) "fov": fov,
      if (degreelist != null) "degreelist": degreelist,
    };
  }
}
