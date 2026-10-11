import '../../../core/network/api_client.dart';

class AuthApi {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final responseBody = response.data;

    final data = responseBody['data'] ?? responseBody;

    final accessToken =
        data['accessToken'] ?? data['access_token'] ?? data['token'];

    if (accessToken == null) {
      throw Exception('accessToken이 없습니다. 로그인 응답 형식을 확인해주세요.');
    }

    return accessToken.toString();
  }
}
