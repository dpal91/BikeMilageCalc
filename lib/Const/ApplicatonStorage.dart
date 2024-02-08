import 'package:get_storage/get_storage.dart';

const String refillHistory = 'RefillHistory';

class ApplicationStorage {
  static saveData(String key, dynamic value) {
    GetStorage storage = GetStorage();
    storage.write(key, value);
  }

  static getData(String key) {
    GetStorage storage = GetStorage();
    return storage.read(key);
  }
}
