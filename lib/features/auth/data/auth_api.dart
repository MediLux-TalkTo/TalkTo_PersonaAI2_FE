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

    final data = response.data['data'];

    if (data == null) {
      throw Exception('login data가 없습니다: ${response.data}');
    }

    final bearerToken = data['bearerToken'];

    if (bearerToken == null) {
      throw Exception('bearerToken이 없습니다. 로그인 응답을 확인해주세요.');
    }

    return bearerToken.toString();
  }
}
