part of breakout_pages;

/// The sign-in screen.
class RegisterPage extends StatefulWidget {
  /// Creates a sign-in screen.
  const RegisterPage({
    required this.onRegister,
    Key? key,
  }) : super(key: key);

  /// Called when users sign in with [Credentials].
  final ValueChanged<Registration> onRegister;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
              Text('Register',
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
                    widget.onRegister(Registration(
                        _emailController.value.text,
                        _passwordController.value.text));
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}