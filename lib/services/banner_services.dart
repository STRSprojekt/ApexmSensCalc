import 'package:apexmsenscalc/models/banner_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerService extends GetxService {
  final bannersRef = FirebaseFirestore.instance
      .collection('banners')
      .withConverter<BannerModel>(
        fromFirestore: (snapshot, _) => BannerModel.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  Future<List<BannerModel>> getBanners() async {
    var querySnapshot = await bannersRef.get();
    var bannerItemList = querySnapshot.docs.map((doc) => doc.data()).toList();
    return bannerItemList;
  }
}
