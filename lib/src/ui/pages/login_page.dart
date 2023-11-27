part of breakout_pages;

/// The sign-in screen.
class LoginPage extends StatefulWidget {
  /// Creates a sign-in screen.
  const LoginPage({
    required this.onSignIn,
    Key? key,
  }) : super(key: key);

  /// Called when users sign in with [Credentials].
  final ValueChanged<Credentials> onSignIn;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Card(
        child: Container(
          constraints: BoxConstraints.loose(const Size(600, 600)),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Sign in',
                  style: Theme.of(context).textTheme.headlineMedium),
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                controller: _emailController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: _passwordController,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () async {
                    widget.onSignIn(Credentials(
                        _emailController.value.text,
                        _passwordController.value.text));
                  },
                  child: const Text('Sign in'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}