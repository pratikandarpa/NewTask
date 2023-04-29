import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:practical_test/constants/app_colors.dart';
import 'package:practical_test/constants/app_fonts.dart';
import 'package:practical_test/constants/app_images.dart';
import 'package:practical_test/constants/app_size.dart';
import 'package:practical_test/pages/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: ((controller) {
      return SafeArea(
        child: Scaffold(body: Obx(() {
          return controller.allUsers.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.allUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: size_10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    if (controller.allUsers[index].picture
                                            .thumbnail ==
                                        "") ...[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          user,
                                          height: 75,
                                          width: 75,
                                          fit: BoxFit.cover,
                                          color: colorBlack,
                                        ),
                                      ),
                                    ] else ...[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          controller.allUsers[index].picture
                                              .thumbnail,
                                          height: 75,
                                          width: 75,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                    const SizedBox(
                                      width: size_15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.allUsers[index].name.first,
                                          style: const TextStyle(
                                              fontFamily: FONT_SEMIBOLD,
                                              fontSize: size_15,
                                              fontWeight: FontWeight.bold,
                                              color: colorBlack),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: size_2,
                                ),
                                Text(
                                  "Age : " + controller.allUsers[index].dob.age.toString(),
                                  style: TextStyle(
                                      fontFamily: FONT_MEDIUM,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size_15,
                                      color: primaryColor),
                                ),
                                const SizedBox(
                                  width: size_2,
                                ),
                                Text(
                                  "Phone : " + controller.allUsers[index].phone!,
                                  style: const TextStyle(
                                      fontFamily: FONT_MEDIUM,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size_15,
                                      color: colorBlack),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  })
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.allUsersOffline.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: size_10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [

                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          user,
                                          height: 75,
                                          width: 75,
                                          fit: BoxFit.cover,
                                          color: colorBlack,
                                        ),
                                      ),
                                    const SizedBox(
                                      width: size_15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.allUsersOffline[index].name,
                                          style: const TextStyle(
                                              fontFamily: FONT_SEMIBOLD,
                                              fontSize: size_15,
                                              fontWeight: FontWeight.bold,
                                              color: colorBlack),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: size_2,
                                ),
                                Text(
                                  "Age : " + controller.allUsersOffline[index].age,
                                  style: TextStyle(
                                      fontFamily: FONT_MEDIUM,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size_15,
                                      color: primaryColor),
                                ),
                                const SizedBox(
                                  width: size_2,
                                ),
                                Text(
                                  "Phone : " + controller.allUsersOffline[index].phone!,
                                  style: const TextStyle(
                                      fontFamily: FONT_MEDIUM,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size_15,
                                      color: colorBlack),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
        })),
      );
    }));
  }
}
