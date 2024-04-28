import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';
import 'package:verified_devnet/modules/dev/dev_signin.dart';

class UserProfile extends StatefulWidget {
  final int index;
  final bool isDeveloper;
  const UserProfile(
      {required this.isDeveloper, required this.index, super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

String? userEmail = '';

void getUserEmail() async {
  List<Map<String, dynamic>> developersCredentialsList =
      await getDeveloperLoginInfo();
  for (var element in developersCredentialsList) {
    if (element['username'] == globalLoggedUser) {
      userEmail = element['email'];
    }
  }
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _aboutController = TextEditingController();
  Future<void> launchEmailApp(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email app';
    }
  }

  Future<void> launchGitLink(String gitlink) async {
    final Uri url = Uri.parse(gitlink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  String aboutText =
      "Passionate Frontend and UI Designer dedicated to crafting engaging digital experiences. Expertise in user-centric design, transforming concepts into visually stunning interfaces. Let's connect!";
  @override
  Widget build(BuildContext context) {
    getUserEmail();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0x412266ff),
      ),
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/others/rectangle.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/abhishek.jpeg',
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              globalLoggedUser,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Frontend Developer',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${projectCardList.length}',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Total Projects',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            (!widget.isDeveloper)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          String email = userEmail!;
                          launchEmailApp(email);
                        },
                        child: Container(
                          height: 40,
                          width: 125,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(36, 39, 96, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                13,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Connect',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          List temp = await getProjectCards();
                          String git = temp[widget.index].gitLink;
                          launchGitLink(git);
                        },
                        child: Container(
                          height: 40,
                          width: 125,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(36, 39, 96, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                13,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Github',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  (!widget.isDeveloper)
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            _aboutController.text = aboutText;
                            aboutBottomSheet();
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(65, 34, 102, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: Text(
                    aboutText,
                    style: GoogleFonts.poppins(
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
    );
  }

  void aboutBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'About',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        maxLines: 6,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                        controller: _aboutController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                aboutText = _aboutController.text;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Submit',
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
