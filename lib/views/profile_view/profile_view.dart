import 'package:flutter/material.dart';
import 'package:signup_login/views/profile_view/profile_viewmodel.dart';
import 'package:signup_login/views/profile_view/widgets/profilemenuwidget.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              title: Center(child: Text("Profile")),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.settings))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage("assets/images/backgroundimage.jpg"))),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(255, 123, 238, 127)
                                    .withOpacity(0.8)),
                            child: const Icon(
                              Icons.edit,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Aman Khan",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const Text(
                      "Amankhan06a@gmail.com",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(159, 65, 241,
                                      139)), // Set your desired color
                            ),
                            child: const Text(
                              "Edit Profile",
                            ))),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const ProfileMenuWidget(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                    const ProfileMenuWidget(
                      icon: Icons.wallet,
                      title: "Billing Details",
                    ),
                    const ProfileMenuWidget(
                      icon: Icons.verified_user,
                      title: "User Management",
                    ),
                    const ProfileMenuWidget(
                      icon: Icons.info,
                      title: "Information",
                    ),
                    ProfileMenuWidget(
                      icon: Icons.logout,
                      title: "Logout",
                      endIcon: false,
                      textColor: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
