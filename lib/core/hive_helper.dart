import 'package:herohub_app/0_data/hive/auth_login_hive_model.dart';
import 'package:herohub_app/1_domain/models/auth_login_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static Future<Box<AuthLoginHive>?> getAuthLoginBox() async {
    try {
      return await Hive.openBox<AuthLoginHive>('authLogin');
    } catch (e) {
      return null;
    }
  }

  static Future<bool> saveAuthLogin(AuthLoginModel? authLogin) async {
    try {
      if (authLogin != null) {
        final authLoginHive = AuthLoginHive(
          authLogin.id,
          authLogin.email,
          authLogin.status,
          authLogin.accessToken,
        );

        final box = await getAuthLoginBox();
        if (box != null) {
          await box.add(authLoginHive);
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<AuthLoginHive?> getCurrentUser() async {
    final box = await getAuthLoginBox();
    return box?.values.first;
  }

  static Future<void> closeAuthLoginBox() async {
    final box = await getAuthLoginBox();
    try {
      if (box != null) {
        await box.clear();
      }
    } catch (e) {
      print(e);
    }
  }
}
