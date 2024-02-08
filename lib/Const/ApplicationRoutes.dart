import 'package:get/get.dart';
import 'package:milage/ModelPages/History/Binding/HistoryBinding.dart';
import 'package:milage/ModelPages/History/Pages/HistoryPage.dart';
import 'package:milage/ModelPages/Home/Binding/HomeBinding.dart';
import 'package:milage/ModelPages/Home/Pages/HomePage.dart';
import 'package:milage/ModelPages/Refill/Binding/RefillBinding.dart';
import 'package:milage/ModelPages/Refill/Pages/RefillPage.dart';
import 'package:milage/ModelPages/Splash/Binding/SplashBinding.dart';
import 'package:milage/ModelPages/Splash/Pages/SplashPage.dart';

class ApplicationRoutes {
  static const String Splash = "/splash";
  static const String Home = "/home";
  static const String Refill = "/home/refill";
  static const String History = "/home/history";

  static List<GetPage<dynamic>> pages = [
    GetPage(name: Splash, page: () => SplashScreen(), transition: Transition.rightToLeft, binding: SplashBinding()),
    GetPage(name: Home, page: () => HomePage(), transition: Transition.rightToLeft, binding: HomeBinding()),
    GetPage(name: Refill, page: () => RefillPage(), transition: Transition.rightToLeft, binding: RefillBinding()),
    GetPage(name: History, page: () => HistoryPage(), transition: Transition.rightToLeft, binding: HistoryBinding()),
  ];
}
