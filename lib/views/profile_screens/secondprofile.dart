import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zoomio_driverapp/data/storage/img_storage.dart';
import 'package:zoomio_driverapp/views/custom_widgets/textformfields.dart';
import 'package:zoomio_driverapp/views/styles/app_styles.dart';

class ProfileScreenTwo extends StatefulWidget {
  const ProfileScreenTwo({super.key});

  @override
  State<ProfileScreenTwo> createState() => _ProfileScreenTwoState();
}

class _ProfileScreenTwoState extends State<ProfileScreenTwo> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final contactController = TextEditingController();
  final genderController = TextEditingController();
  final vehiclePreferenceController = TextEditingController();
  final experienceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender;
  String? selectedVehiclePreference;
  String? profileImg;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: const BoxDecoration(
                color: ThemeColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                            50), // Adjusted to match CircleAvatar
                      ),
                      width: 100, // Adjusted size to fit the avatar radius
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            50), // Circular shape for the image
                        child: profileImg != null
                            ? Image.network(
                                profileImg!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    color: Colors.white,
                                  );
                                },
                              )
                            : const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    // Positioned widget for camera icon
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          profileImage(context); // Method to select image
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ProfileFields(
                          controller: nameController,
                          textStyle: const TextStyle(color: Colors.black),
                          hintText: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            if (value.length <= 3) {
                              return "Name must be at least 3 characters long";
                            }
                            final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
                            if (!nameRegex.hasMatch(value)) {
                              return "Name can only contain letters and spaces";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: Profilefields(
                          controller: ageController,
                          textStyle: const TextStyle(color: Colors.black),
                          hintText: "Age",
                          keyBoardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your age";
                            }
                            final age = int.tryParse(value);
                            if (age == null) {
                              return "Age must be a number";
                            }
                            if (age > 65) {
                              return "Age greater than 65 is not allowed";
                            }
                            if (age < 19) {
                              return "Age must be at least 19";
                            }
                            return null;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> profileImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      String? res = await ImageStorageService()
          .uploadProfileImg(pickedImage.path, context);
      setState(() {
        profileImg = res;
      });
    }
  }
}
