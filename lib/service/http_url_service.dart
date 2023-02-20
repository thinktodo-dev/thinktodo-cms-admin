import 'package:global_configs/global_configs.dart';

String baseUrl = GlobalConfigs().get("apiUrl");

class HttpUrlService {
  static String getProposalDetail = '$baseUrl/v1/secure/mobile/proposal';
  static String login = 'http://localhost:3000/core/auth/login';
  static String verifyToken = 'http://localhost:3000/core/verify-token';
}