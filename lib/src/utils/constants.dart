part of breakout_utils;

class Constants {
  //////////
  // GENERAL
  //////////
  static const String APP_NAME = 'Breakout Demo';

  //////////
  // API
  //////////
  static const String API_URL = 'http://localhost:3000';

  // Routes
  static const String AUTH_ROUTE = '/auth/token';
  static const String REGISTER_ROUTE = '/auth/register';
  static const String PROMPT_ROUTE = '/chat/prompt';
  static const String GET_BREAKOUTS_ROUTE = '/breakouts';
  static const String CREATE_BREAKOUT_SESSION_ROUTE = '/breakouts/session/new';
  static const String GET_BREAKOUT_SESSION_ROUTE = '/breakouts/session/{id}';
}

enum DeploymentMode {
  /// Use a local study protocol & deployment and store data locally in a file.
  LOCAL,
  LIVE
}
