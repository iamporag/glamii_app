import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_client.dart';

class AuthRepo {
  // Local veriable
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  // Repo start
  AuthRepo({required this.apiClient, required this.sharedPreferences});
}
