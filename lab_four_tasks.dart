class LabTask extends StatelessWidget {
  const LabTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SignUpScreen(),
      initialRoute: SignUpScreen.routeName,
      onGenerateRoute: (RouteSettings s) {
        switch (s.name) {
          case SignUpScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            );
          case LoginScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => LoginScreen(),
            );
          case InfoScreen.routeName:
            var args = s.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => InfoScreen(
                username: args['username']!,
                password: args['password']!,
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            );
        }
      },
      // routes: {
      //   SignUpScreen.routeName: (context) => SignUpScreen(),
      //   InfoScreen.routeName: (context) => InfoScreen(),
      //   LoginScreen.routeName: (context) => LoginScreen(),
      // },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const String routeName = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          },
          child: Text('Sign Up'),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final usernameCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: passCtrl,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (usernameCtrl.text.isEmpty || passCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter username and password')));
                  return;
                }
                Navigator.of(context)
                    .pushNamed(InfoScreen.routeName, arguments: {
                  'username': usernameCtrl.text,
                  'password': passCtrl.text,
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  final String username, password;

  static const String routeName = '/info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Username: $username'),
            Text('Password: ${password.split('').map((e) => '*').join('')}'),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Task2()));
                },
                child: Text('Task 2'))
          ],
        ),
      ),
    );
  }
}

class Task2 extends StatefulWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  String? message;
  @override
  Widget build(BuildContext context) {
    final msgCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Task 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: message == null
              ? [
                  TextField(
                    controller: msgCtrl,
                    decoration: InputDecoration(
                      labelText: 'Enter Message',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        message = msgCtrl.text.isEmpty
                            ? 'Default Message'
                            : msgCtrl.text;
                      });
                    },
                    child: Text('Enter'),
                  ),
                ]
              : [
                  Text('$message'),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        message = null;
                      });
                    },
                    child: Text('Clear'),
                  )
                ],
        ),
      ),
    );
  }
}
