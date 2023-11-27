part of breakout_services;

class AuthService {
  const AuthService();

  Future<http.Response> authenticate (String email, String password) async {
    final response = await http
        .post(Uri.parse(
        Constants.API_URL + Constants.AUTH_ROUTE),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        })
    );
    return response;
  }

  Future<http.Response> register (String email, String password) async {
    final response = await http
        .post(Uri.parse(
        Constants.API_URL + Constants.REGISTER_ROUTE),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        })
    );
    return response;
  }
}