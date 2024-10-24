class ProfileModel {
  String id; // Unique identifier for the profile
  String name;
  int age;
  String contactNumber;
  String gender;
  String vehiclePreference;
  int experience;
  String? profileImg;

  ProfileModel({
    required this.id, // Include the id as a required parameter
    required this.name,
    required this.age,
    required this.contactNumber,
    required this.gender,
    required this.vehiclePreference,
    required this.experience,
    this.profileImg,
  });

  // Converts the Profile object to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include the id in the map
      'name': name,
      'age': age,
      'contactNumber': contactNumber,
      'gender': gender,
      'vehiclePreference': vehiclePreference,
      'experience': experience,
      'profileImg': profileImg,
    };
  }

  // Creates a Profile object from a Map
  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'], // Extract the id from the map
      name: map['name'],
      age: map['age'],
      contactNumber: map['contactNumber'],
      gender: map['gender'],
      vehiclePreference: map['vehiclePreference'],
      experience: map['experience'],
      profileImg: map['profileImg'],
    );
  }
}
