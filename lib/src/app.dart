part of breakout_app;

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // final appState = AppState();
  final BreakoutRepo repository = BreakoutRepo();

  /// The route configuration.
  late final GoRouter _router = GoRouter(
    initialLocation: '/signin',
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: '/signin',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
              key: state.pageKey,
              child: LoginPage(
                onSignIn: (Credentials credentials) {
                  BreakoutAuthScope.of(context)
                      .signIn(credentials.email, credentials.password);
                },
              ),
            ),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
              key: state.pageKey,
              child: RegisterPage(
                onRegister: (Registration registration) {
                  BreakoutAuthScope.of(context)
                      .register(registration.email, registration.password);
                },
              ),
            ),
      ),
      GoRoute(
          name: 'home',
          path: '/',
          builder:
              (BuildContext context,
              GoRouterState state) => const HomePage()
      ),
      GoRoute(
          name: 'settings',
          path: '/settings',
          builder:
              (BuildContext context,
              GoRouterState state) => const SettingsPage()
      ),
      GoRoute(
          name: 'breakouts',
          path: '/breakouts',
          builder:
              (BuildContext context,
              GoRouterState state) => const BreakoutsPage()
      ),
      GoRoute(
        name: 'breakout',
        path: '/breakout/:breakoutid',
        builder:
            (BuildContext context,
            GoRouterState state) => BreakoutPage(),
      ),

    ],
    redirect: _guard,
    refreshListenable: _auth,
  );

  @override
  Widget build(BuildContext context) => BreakoutAuthScope(
      notifier: _auth,
      child: RepositoryProvider.value(
        value: repository,
        child: MaterialApp.router(
          routerConfig: _router,
        ),
      )
  );

  final BreakoutAuth _auth = BreakoutAuth();

  String? _guard(BuildContext context, GoRouterState state) {
    final bool signedIn = _auth.signedIn;
    final bool signingIn = state.matchedLocation == '/signin';

    // Go to /signin if the user is not signed in
    if (!signedIn && !signingIn) {
      return '/signin';
    }
    // Go to /books if the user is signed in and tries to go to /signin.
    else if (signedIn && signingIn) {
      return '/';
    }

    // no redirect
    return null;
  }
}

class BreakoutLoadingPage extends StatelessWidget {
  const BreakoutLoadingPage({Key? key}) : super(key: key);

  Future<bool> init(BuildContext context) async {
    //await MImeBackend().initialize();
    // await MImeBackend().authenticate(context);
    //await MImeEngine().initialize();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [CircularProgressIndicator()],
            )
        )
    );
  }
}

class SnapshotError extends StatelessWidget {
  SnapshotError(Object error, {Key? key})
      : error = error is Exception ? error : Exception(error),
        super(key: key);
  final Exception error;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Center(
      child:
      SizedBox(
        width: size.width - 40,
        height: size.height - 80,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Oh no, you've found me."),
            SelectableText(error.toString()),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
      key: key,
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
          FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
      child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}