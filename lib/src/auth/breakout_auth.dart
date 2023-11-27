part of breakout_auth;

/// A mock authentication service.
class BreakoutAuth extends ChangeNotifier {
  bool _signedIn = false;

  late BreakoutUser user = BreakoutUser();
  late AuthService authServices = const AuthService();

  /// Whether user has signed in.
  bool get signedIn => _signedIn;

  /// Signs out the current user.
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign out.
    user.signOut();
    _signedIn = user.isAuthenticated;
    notifyListeners();
  }

  /// Signs in a user.
  Future<bool> signIn(String email, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in. Allow any password.
    var response = await authServices.authenticate(email, password);
    if (response.statusCode == 200) {
      _signedIn = createAuthUser(response);
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
    return _signedIn;
  }

  /// Registers a user.
  Future<bool> register(String email, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    var response = await authServices.register(email, password);
    if (response.statusCode == 200) {
      _signedIn = createAuthUser(response);
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
    notifyListeners();
    return _signedIn;
  }

  bool createAuthUser(response){
    Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;
    BreakoutUser u = BreakoutUser.fromJson(data["user"]);
    u.authenticated(BreakoutToken.fromJson(data["access_token"]));
    user = u;
    return user.isAuthenticated;
  }
}

/// An inherited notifier to host [BreakoutAuth] for the subtree.
class BreakoutAuthScope extends InheritedNotifier<BreakoutAuth> {
  /// Creates a [BreakoutAuthScope].
  const BreakoutAuthScope({
    required BreakoutAuth notifier,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: notifier, child: child);

  /// Gets the [BreakoutAuth] above the context.
  static BreakoutAuth of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<BreakoutAuthScope>()!
      .notifier!;
}


/// Credential data class.
class Credentials {
  /// Creates a credential data object.
  Credentials(this.email, this.password);

  /// The password of the credentials.
  final String password;

  /// The password of the credentials.
  final String email;

}

class Registration {
  /// Creates a credential data object.
  Registration(this.email, this.password);

  /// The password of the credentials.
  final String password;

  /// The password of the credentials.
  final String email;
}