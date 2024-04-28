import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verified_devnet/modules/company/user_profile.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';
import 'package:verified_devnet/starter/askmenu.dart';

class CompanyHome extends StatefulWidget {
  final String loggedCompany;
  const CompanyHome({
    required this.loggedCompany,
    super.key,
  });

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

List tempList = [];

class _CompanyHomeState extends State<CompanyHome> {
  List _searchedItems = [];
  List verifiedProjects = [];

  @override
  void initState() {
    super.initState();
    fun();
  }

  void fun() {
    getCards();
  }

  List sortCards() {
    List list = [];
    for (var element in tempList) {
      if (element.status == 'Verified') {
        list.add(element);
      }
    }
    return list;
  }

  void getCards() async {
    tempList = await getProjectCards();
    _searchedItems = sortCards();
    setState(() {});
    verifiedProjects = _searchedItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
        leading: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/core2web.png',
              ),
              radius: 20,
            ),
          ],
        ),
        title: Text(
          widget.loggedCompany,
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
            height: 30,
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
                itemCount: verifiedProjects.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(156, 44, 243, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(152, 83, 206, 1),
                          Color.fromRGBO(50, 65, 224, 1)
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // ========= Project Name ============
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  verifiedProjects[index].projectName,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(
                                Icons.verified_rounded,
                                size: 25,
                                color: Color.fromARGB(255, 14, 255, 22),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
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
                                                text: verifiedProjects[index]
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
                                                text: 'Time required: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: verifiedProjects[index]
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
                                                text: verifiedProjects[index]
                                                    .gitLink,
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
                                                text: verifiedProjects[index]
                                                    .techStack,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // ========= Type ============
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
                                                text: verifiedProjects[index]
                                                    .type,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/abhishek.jpeg',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(42, 46, 68, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return UserProfile(
                                                index: index,
                                                isDeveloper: false,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Connect',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.forward,
                                                color: Colors.yellow,
                                              )
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
      verifiedProjects = _searchedItems;
    });
  }
}
