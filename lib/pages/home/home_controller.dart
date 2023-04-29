import 'dart:convert';

import 'package:get/get.dart';
import 'dart:async';
import 'package:practical_test/apiservices/api_services.dart';
import 'package:practical_test/db/db_model.dart';
import 'package:practical_test/db/user_database.dart';
import 'package:practical_test/pages/home/model/home_model.dart';
import 'package:practical_test/utils/utils.dart';

class HomeController extends GetxController {
  final allUsers = <Result>[].obs;
  final allUsersOffline = <Welcome>[].obs;

  @override
  void onReady() {
    super.onReady();
    getUser();

    Timer(Duration(seconds: 3), () {
      callGetUserApi();
    });
  }

  Future<void> callGetUserApi() async {
    checkConnectivity().then((value) {
      if (value) {
        // openAndCloseLoadingDialog(true);
        String endPoint = ApiService.getUser;

        ApiService.callGetApi(endPoint, Get.context!, null).then((value) {
          HomeModel homeModel = HomeModel.fromJson(value!);
          if (homeModel.results.isNotEmpty) {
            allUsers.value = homeModel.results;

            UserDatabase.instance.delete();

            for (int i = 0; i < allUsers.length; i++) {
              UserDatabase.instance.create(Welcome(
                  name: allUsers[i].name.first,
                  gender: allUsers[i].gender,
                  location: allUsers[i].location.city,
                  email: allUsers[i].email,
                  age: allUsers[i].dob.age.toString(),
                  phone: allUsers[i].phone));
            }
          } else {
            showSnackBar(Get.context!, "No Data Found");
          }
        });
      } else {
        print("No net");
        getUser();
      }
    });
  }

  Future getUser() async {
    allUsersOffline.clear();
    allUsersOffline.value = await UserDatabase.instance.readAllNotes();
  }
}
