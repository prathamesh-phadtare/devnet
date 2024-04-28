import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/admin/admin_home.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';

class Videocall extends StatefulWidget {
  final ProjectCard? obj;
  const Videocall({this.obj, super.key});

  @override
  State<Videocall> createState() => _VideocallState();
}

class _VideocallState extends State<Videocall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              "assets/images/mark.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "20.10",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/candidate.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // Adjust this value according to your needs
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 36, 190, 41),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Verify",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_outward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mic_off,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.cameraswitch,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateFlagToList(ProjectCard obj) async {
    ProjectCard newObj = ProjectCard(
      projectId: obj.projectId,
      developerName: obj.developerName,
      projectName: obj.projectName,
      timeRequired: obj.timeRequired,
      gitLink: obj.gitLink,
      techStack: obj.techStack,
      type: obj.type,
      status: 'Verified',
    );
    await updateFlag(newObj);
    projectCardList = await getProjectCards();
    setState(() {});
  }

  // ================== CONFIRM Verify ===================
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(54, 36, 73, 1),
          title: Text(
            'Confirmation',
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
          content: Text(
            'Are you sure?',
            style: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 30,
                // width: 70,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                height: 30,
                // width: 70,
                child: Center(
                  child: Text(
                    'Verify',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onPressed: () {
                updateFlagToList(widget.obj!);
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AdminHome();
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
