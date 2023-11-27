part of breakout_models;

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutUser {

  /// Unique MIme ID
  int? id;

  /// Is this user activated in any studies?
  bool? isActivated;

  /// The user's email
  String? email;

  /// The list of roles that this user has in MIme.
  List<String> roles = [];

  BreakoutToken? token;

  BreakoutUser();

  /// Set or update the authenticated [OAuthToken] token for this user.
  void authenticated(BreakoutToken token) => this.token = token;

  /// Returns true if the user is logged in; that is, has a valid token.
  bool get isAuthenticated => (token != null);

  /// Returns true if the user's email is verified.
  bool get isEmailVerified => (token != null);

  /// Sign out the current user.
  Future<void> signOut() async {
    token = null;
  }

  /// Reload the data of the current user (e.g., [fullName],
  /// [telephone], etc.) from the MIme web service.
  Future<void> reload() async {

  }

  factory BreakoutUser.fromJson(
      Map<String, dynamic> json) =>
      _$BreakoutUserFromJson(json);
  Map<String, dynamic> toJson() => _$BreakoutUserToJson(this);

  @override
  String toString() =>
      "'user': { 'email':$email, 'id': $id }";
}