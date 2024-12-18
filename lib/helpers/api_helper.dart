import 'package:outer_pos_app/utils/constants.dart';

class ApiHelper {
  static Uri buildUri(String endpoint) {
    return Uri.parse('${AppConstants.baseUrl}$endpoint');
  }
}
