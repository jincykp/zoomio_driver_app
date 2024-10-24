import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoomio_driverapp/data/model/profile_model.dart';

Future<void> addDriverProfile(ProfileModel profileModel) async {
  final driverProfile =
      FirebaseFirestore.instance.collection('driver_profile').doc();
  profileModel.id = driverProfile.set(profileModel.toMap()) as String;
}
