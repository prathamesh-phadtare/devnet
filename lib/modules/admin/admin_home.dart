import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verified_devnet/modules/admin/videocall.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';
import 'package:verified_devnet/starter/askmenu.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<ProjectCard> _searchedItems = [];
  @override
  void initState() {
    super.initState();
    fun();
  }

  void fun() async {
    _searchedItems = await getProjectCards();
    projectCardList = _searchedItems;
    setState(() {});
  }

  List projectCardList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
        leading: const Row(
          children: [
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/admin-image.jpg',
              ),
              radius: 20,
            ),
          ],
        ),
        title: Text(
          'admin',
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(235, 235, 244, 0.8),
            fontSize: 16,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _showMyDialog();
            },
            child: const Icon(
              Icons.logout,
              color: Color.fromRGBO(235, 235, 244, 0.8),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 47, 27, 71),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    30,
                  ),
                ),
              ),
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    filter(value);
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: projectCardList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(152, 83, 206, 1),
                          Color.fromRGBO(50, 65, 224, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ========= Project Name ============
                                    Text(
                                      projectCardList[index].projectName,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // ========= Name ============
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Developer: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: projectCardList[index]
                                                .developerName,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ========= Time required ============
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Duration: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: projectCardList[index]
                                                .timeRequired,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ========= Git repo ============
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Github: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                projectCardList[index].gitLink,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ========= Tech Stack ============
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'TechStack: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: projectCardList[index]
                                                .techStack,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Type: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: projectCardList[index].type,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  20,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  projectCardList[index]
                                                      .status
                                                      .toUpperCase(),
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                (projectCardList[index]
                                                            .status ==
                                                        'Verified')
                                                    ? const Icon(
                                                        Icons.verified_rounded,
                                                        size: 25,
                                                        color: Colors.green,
                                                      )
                                                    : const Icon(
                                                        Icons.close,
                                                        size: 25,
                                                        color: Colors.red,
                                                      ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/abhishek.jpeg'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Videocall(
                                          obj: projectCardList[index],
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: (projectCardList[index].status ==
                                        'Verified')
                                    ? const SizedBox()
                                    : Container(
                                        width: 120,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              20,
                                            ),
                                          ),
                                          color: Color.fromRGBO(42, 46, 68, 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Verify it'.toUpperCase(),
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.forward,
                                                  color: Colors.yellow,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================== CONFIRM LOGOUT ===================
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
                  color: Colors.green,
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
                  color: Colors.red,
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
                    'Log-Out',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AskMenu();
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

  void filter(String searchText) async {
    List<ProjectCard> results = [];
    if (searchText.isEmpty) {
      results = await getProjectCards();
    } else {
      for (var element in _searchedItems) {
        if (element.techStack
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          results.add(element);
        }
      }
    }

    setState(() {
      _searchedItems = results;
      projectCardList = _searchedItems;
    });
  }
}
