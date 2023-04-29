import 'package:get/get.dart';
import 'package:practical_test/pages/home/home_bindings.dart';
import 'package:practical_test/pages/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBindings()),
  ];
}
