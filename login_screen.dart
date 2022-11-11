class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        color: Colors.amber[50],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const OnboardingScreen(),
                    //   ),
                    // );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
