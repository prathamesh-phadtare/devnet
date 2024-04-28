import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:verified_devnet/modules/admin/admin_home.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _passwordVisible = false;
  Map<String, String> adminMap = {
    'priyank': '123',
    'abhishekaslk': '314',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Admin!",
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, bottom: 20, left: 40, right: 40),
                          child: Form(
                            key: _formKey,
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
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
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
                                        stops: [0.5, 0.8]),
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
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
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
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            bool flag = false;
                            bool validatFlag =
                                _formKey.currentState!.validate();
                            if (validatFlag) {
                              adminMap.forEach(
                                (key, value) {
                                  if (key == _userController.text &&
                                      value == _passwordController.text) {
                                    flag = true;
                                  }
                                },
                              );
                              if (flag) {
                                SnackBar snackBar = const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Successfully Signed In'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar,
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const AdminHome();
                                    },
                                  ),
                                );
                              } else {
                                SnackBar snackBar = const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Invalid credentials'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar,
                                );
                              }
                            }
                          },
                          child: Container(
                            width: 314,
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(156, 63, 228, 1),
                                      Color.fromRGBO(198, 86, 71, 1)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0.1, 0.9])),
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 18),
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
}
