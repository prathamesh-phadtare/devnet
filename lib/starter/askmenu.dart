import 'package:flutter/material.dart';
import 'package:verified_devnet/modules/admin/admin_login.dart';
import 'package:verified_devnet/modules/company/com_signin.dart';
import 'package:verified_devnet/modules/dev/dev_signin.dart';
import 'package:google_fonts/google_fonts.dart';

class AskMenu extends StatefulWidget {
  const AskMenu({super.key});

  @override
  State<AskMenu> createState() => _AskMenuState();
}

class _AskMenuState extends State<AskMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: Stack(
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
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AdminLogin();
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 2),
                        color: const Color.fromARGB(255, 215, 24, 225),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Admin",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Icon(
                            Icons.admin_panel_settings,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Who are you?",
                  style: GoogleFonts.poppins(
                      fontSize: 40.33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "Choose your identity!",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(171, 147, 201, 1),
                        width: 3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(55, 40, 74, 1),
                        Color.fromRGBO(83, 19, 133, 1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.business_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Company",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComLogin();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                            color: const Color.fromARGB(255, 215, 24, 225),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(171, 147, 201, 1),
                      width: 3,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(55, 40, 74, 1),
                        Color.fromRGBO(83, 19, 133, 1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.developer_mode_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Developer",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const DevSignIn();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 2),
                            color: const Color.fromARGB(255, 215, 24, 225),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
