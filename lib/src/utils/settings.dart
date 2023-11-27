part of breakout_utils;

/// Misc. settings for MIme
///
/// This class is a singleton, access using `Settings()`.
///
/// Supports:
///  * setting debug level - see [debugLevel]
///  * getting shared preferences - see [preferences]
///  * getting app info - see [packageInfo]
///  * generating a unique and annonymous user id - see [userId]
///
class Settings {
  static const String USER_ID_KEY = 'user_id';

  static final Settings _instance = Settings._();
  factory Settings() => _instance;
  Settings._();

  SharedPreferences? _preferences;
  PackageInfo? _packageInfo;
  String? _appName;
  String? _packageName;
  String? _version;
  String? _buildNumber;
  String? _localApplicationPath;
  String? _mimeBasePath;
  final Map<String, String> _deploymentBasePaths = {};
  String _timezone = 'UTC';

  /// The global debug level setting.
  ///
  /// See [DebugLevel] for valid debug level settings.
  /// Can be changed on runtime.
  DebugLevel debugLevel = DebugLevel.WARNING;

  /// The app name.
  /// `CFBundleDisplayName` on iOS, `application/label` on Android.
  String? get appName => _appName;

  /// The package name.
  /// `bundleIdentifier` on iOS, `getPackageName` on Android.
  String? get packageName => _packageName;

  /// The package version.
  /// `CFBundleShortVersionString` on iOS, `versionName` on Android.
  String? get version => _version;

  /// The build number.
  /// `CFBundleVersion` on iOS, `versionCode` on Android.
  String? get buildNumber => _buildNumber;

  /// A simple persistent store for simple data. Note that data is saved in
  /// plain format and should hence **not** be used for sensitive data.
  ///
  /// Wraps NSUserDefaults (on iOS) and SharedPreferences (on Android).
  SharedPreferences? get preferences => _preferences;

  /// Package information
  PackageInfo? get packageInfo => _packageInfo;

  /// Path to a directory where the application may place data that is
  /// user-generated.
  Future<String> get localApplicationPath async {
    if (_localApplicationPath == null) {
      final directory = await getApplicationDocumentsDirectory();
      _localApplicationPath = directory.path;
    }
    return _localApplicationPath!;
  }

  /// The base path for storing all MIme related files on the form
  ///
  ///  `<localApplicationPath>/MIme`
  ///
  Future<String> get mimeBasePath async {
    if (_mimeBasePath == null) {
      final directory = await Directory('${await localApplicationPath}/mime')
          .create(recursive: true);
      _mimeBasePath = directory.path;
    }

    return _mimeBasePath!;
  }

  /// The base path for storing all deployment related files on the form
  ///
  ///  `<localApplicationPath>/MIme/deployments/<study_deployment_id>`
  ///
  Future<String> getDeploymentBasePath(String studyDeploymentId) async {
    if (_deploymentBasePaths["base"] == null) {
      final directory = await Directory(
          '${await mimeBasePath}/base')
          .create(recursive: true);
      _deploymentBasePaths["base"] = directory.path;
    }

    return _deploymentBasePaths["base"]!;
  }

  /// The local time zone setting of this app.
  String get timezone => _timezone;

  /// Initialize settings. Must be called before using any settings.
  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
    _packageInfo ??= await PackageInfo.fromPlatform();

    _appName = _packageInfo!.appName;
    _packageName = _packageInfo!.packageName;
    _version = _packageInfo!.version;
    _buildNumber = _packageInfo!.buildNumber;

    await localApplicationPath;
    await mimeBasePath;

    debug('Shared Preferences:');
    _preferences!
        .getKeys()
        .forEach((key) => debug('[$key] : ${_preferences!.get(key)}'));

    // setting up time zone settings
    tz.initializeTimeZones();
    _timezone = tz.local.name;
    info('Time zone set to $timezone');
    info('$runtimeType initialized');
  }

  String? _userId;

  /// Generate a user id that is;
  ///  * unique
  ///  * anonymous
  ///  * persistent
  ///
  /// This id is generated the first time this method is called and then stored
  /// on the phone in-between sessions, and will therefore be the same for
  /// the same app on the same phone.
  Future<String> get userId async {
    assert(_preferences != null,
    "Setting is not initialized. Call 'Setting().init()' first.");
    if (_userId == null) {
      _userId = preferences!.get(USER_ID_KEY) as String?;
      if (_userId == null) {
        _userId = Uuid().v1();
        await preferences!.setString(USER_ID_KEY, _userId!);
      }
    }
    return _userId!;
  }
}

/// Debugging levels.
enum DebugLevel { NONE, INFO, WARNING, DEBUG }
