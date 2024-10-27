import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoomio_driverapp/views/custom_widgets/cutom_profile_container.dart';
import 'package:zoomio_driverapp/views/styles/app_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.sunny))],
        //backgroundColor: ThemeColors.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                      backgroundColor: ThemeColors.textColor,
                      maxRadius: 50,
                      minRadius: 50,
                      backgroundImage: AssetImage("assets/download.png")
                      // Show icon when there is no image

                      ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
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
                          Icons.edit,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              Text(
                "Jincy",
                style: GoogleFonts.alikeAngular(fontWeight: FontWeight.bold),
              ),
              Text(
                "8592861876",
                style: GoogleFonts.alikeAngular(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomListTileCard(
                  leadingIcon: Icons.person,
                  title: "Personal Information",
                  onTap: () {}),
              const SizedBox(
                height: 10,
              ),
              CustomListTileCard(
                  leadingIcon: Icons.history,
                  title: "Ride History",
                  onTap: () {}),
              const SizedBox(
                height: 10,
              ),
              CustomListTileCard(
                  leadingIcon: Icons.settings, title: "Settings", onTap: () {}),
              const SizedBox(
                height: 10,
              ),
              CustomListTileCard(
                  leadingIcon: Icons.sync_problem,
                  title: "Legal & Compliance",
                  onTap: () {}),
              const SizedBox(
                height: 10,
              ),
              CustomListTileCard(
                  leadingIcon: Icons.logout, title: "Log Out", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
