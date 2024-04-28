import 'package:flutter/material.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/company/com_signup.dart';
import 'package:verified_devnet/modules/company/company_home.dart';

class ComLogin extends StatefulWidget {
  const ComLogin({super.key});

  @override
  State<ComLogin> createState() => _ComLoginState();
}

class _ComLoginState extends State<ComLogin> {
  bool _passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? loggedCompany;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
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
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        const Text(
                          "Hire the Talent!",
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
                                top: 40, bottom: 20, left: 40, right: 40),
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
                                      stops: [0.5, 0.8],
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter valid username';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _userController,
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
                                        color: Color.fromRGBO(164, 164, 164, 1),
                                      ),
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
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter valid password';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _passwordController,
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
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                      ),
                                      hintText: "Password",
                                      hintStyle: const TextStyle(
                                          color:
                                              Color.fromRGBO(164, 164, 164, 1)),
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
                                              return const ComRegister();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(164, 164, 164, 1),
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
                            bool validatFlag =
                                _formKey.currentState!.validate();
                            if (validatFlag) {
                              await authenticateCompany();
                            }
                            setState(() {});
                          },
                          child: Container(
                            width: 314,
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(156, 63, 228, 1),
                                  Color.fromRGBO(198, 86, 71, 1)
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
          ]),
        ),
      ),
    );
  }

  Future authenticateCompany() async {
    bool validate = false;
    List<Map<String, dynamic>> developersCredentials =
        await getCompanyLoginInfo();
    for (var element in developersCredentials) {
      if (element['username'] == _userController.text &&
          element['password'] == _passwordController.text) {
        validate = true;
        loggedCompany = _userController.text;
      }
    }
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
            return CompanyHome(loggedCompany: loggedCompany!);
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
