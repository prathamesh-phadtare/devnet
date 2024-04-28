import 'package:flutter/material.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/dev/dev_signup.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';

class DevSignIn extends StatefulWidget {
  const DevSignIn({super.key});

  @override
  State<DevSignIn> createState() => _DevSignInState();
}

String globalLoggedUser = '';

class _DevSignInState extends State<DevSignIn> {
  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? loggedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/toplefmocs.png",
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/images/toprigmocs.png",
                      fit: BoxFit.cover,
                      height: 300,
                      width: 800,
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/bottom.png",
                    height: 310,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      const Text(
                        "Build with us!",
                        style: TextStyle(
                            fontSize: 40.33,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const Text(
                        "welcome back we missed you",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            bottom: 20,
                            left: 40,
                            right: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Username",
                                style: TextStyle(
                                    color: Color.fromRGBO(164, 164, 164, 1)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(54, 36, 73, 1),
                                        Color.fromRGBO(33, 17, 52, 1)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0.5, 0.8]),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid username';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _userController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Color.fromRGBO(164, 164, 164, 1),
                                    ),
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(164, 164, 164, 1)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Password",
                                style: TextStyle(
                                  color: Color.fromRGBO(164, 164, 164, 1),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(54, 36, 73, 1),
                                      Color.fromRGBO(33, 17, 52, 1)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0.5, 0.8],
                                  ),
                                ),
                                child: TextFormField(
                                  obscureText: !_passwordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _passwordController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    errorStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.key,
                                      color: Color.fromRGBO(164, 164, 164, 1),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      color: Color.fromRGBO(164, 164, 164, 1),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: Color.fromRGBO(164, 164, 164, 1),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const DevSignUp();
                                          },
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Color.fromRGBO(164, 164, 164, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          bool validateFlag = _formKey.currentState!.validate();
                          await authenticateDeveloper(validateFlag);
                          setState(() {});
                        },
                        child: Container(
                          width: 314,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(156, 63, 228, 1),
                                Color.fromRGBO(198, 86, 71, 1),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.1, 0.9],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future authenticateDeveloper(bool validateFlag) async {
    bool validate = false;
    List<Map<String, dynamic>> developersCredentials =
        await getDeveloperLoginInfo();
    print(developersCredentials);
    for (var element in developersCredentials) {
      if (element['username'] == _userController.text &&
          element['password'] == _passwordController.text) {
        validate = true;
        loggedUser = _userController.text;
        globalLoggedUser = loggedUser!;
        setState(() {});
      }
    }
    if (validateFlag) {
      if (validate) {
        SnackBar snackBar = const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Successfully Signed In'),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DevHome(loggedUser: loggedUser!);
            },
          ),
        );
      } else {
        SnackBar snackBar = const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid Credentials'),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar,
        );
      }
    }
  }
}
