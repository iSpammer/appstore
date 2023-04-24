
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:carisma/models/landing_model.dart';
import 'package:carisma/models/home_banner_model.dart';

class HomeViewModel extends ChangeNotifier {
  
  late HomeBannerModel _homeBanner = HomeBannerModel(discountBanners: [], topBanners: []);
  HomeBannerModel get homeBanner => _homeBanner;

  late List<LandingModel> _landings = [LandingModel(text: "", iconPath: "assets/icons/Flash Icon.svg", clickThrough: "")];
  List<LandingModel> get landings => _landings;

  void getHomeBannerInFirebase() {
    FirebaseFirestore.instance.collection('home_page').doc('banners').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic>? jsonData;
        jsonData = documentSnapshot.data() as Map<String, dynamic>?;
        _homeBanner = HomeBannerModel.fromJson(jsonData!);
        notifyListeners();
      } else {
        print('not exist');
      }
    });
  }
  
  Future<String> getTopBannerImageInFirebase(String path) async {
    try {
      String result = await FirebaseStorage.instance.ref(path).getDownloadURL();
      return Future.value(result);
    } on FirebaseException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
    return Future.value("");
  }

  void getLandings() {
    _landings =  [
      LandingModel(text: "Flash Deal", iconPath: "assets/icons/Flash Icon.svg", clickThrough: ""),
      LandingModel(text: "Bill", iconPath: "assets/icons/Bill Icon.svg", clickThrough: ""),
      LandingModel(text: "Game", iconPath: "assets/icons/Game Icon.svg", clickThrough: ""),
      LandingModel(text: "Daily Gift", iconPath: "assets/icons/Gift Icon.svg", clickThrough: ""),
      LandingModel(text: "More", iconPath: "assets/icons/Discover.svg", clickThrough: ""),
    ];
  }
}