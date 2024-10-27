import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoomio_driverapp/data/model/profile_model.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save a profile to Firestore
  Future<void> saveProfile(ProfileModel profile) async {
    try {
      // Use 'set' instead of 'add' to ensure the ID is set and avoids duplicates
      await _firestore
          .collection('profiles')
          .doc(profile.id)
          .set(profile.toMap());
    } catch (e) {
      throw Exception("Failed to save profile: $e");
    }
  }

  // Update an existing profile in Firestore
  Future<void> updateProfile(ProfileModel profile) async {
    try {
      if (profile.id != null) {
        await _firestore
            .collection('profiles')
            .doc(profile.id)
            .update(profile.toMap());
      } else {
        throw Exception("Profile ID is null. Cannot update profile.");
      }
    } catch (e) {
      throw Exception("Failed to update profile: $e");
    }
  }

  // Fetch a profile from Firestore by ID
  Future<ProfileModel?> fetchProfile(String id) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('profiles').doc(id).get();
      if (doc.exists) {
        return ProfileModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        return null; // Profile not found
      }
    } catch (e) {
      throw Exception("Failed to fetch profile: $e");
    }
  }

  // Delete a profile from Firestore
  Future<void> deleteProfile(String id) async {
    try {
      await _firestore.collection('profiles').doc(id).delete();
    } catch (e) {
      throw Exception("Failed to delete profile: $e");
    }
  }
}
