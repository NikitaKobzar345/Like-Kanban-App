class AuthRepository {
  Future<void> login({String? username, String? password}) async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('failed log in');
  }
}
