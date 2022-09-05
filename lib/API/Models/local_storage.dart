import 'package:get_storage/get_storage.dart';

class GetLocalStorage {
  static final storage = GetStorage();

  static saveToken(Map<String, String> user) async {
    storage.write("uId", user["uId"]);
    storage.write("token", user["token"]);
    storage.write('name', user['name']);
    storage.write('email', user['email']);
  }

  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String>(key);

    return user;
  }

  static deleteUserTokenAnduId() {
    storage.remove("uId");
    storage.remove("token");
    storage.remove('name');
    storage.remove('email');
  }
}
