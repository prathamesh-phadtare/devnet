import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/company/user_profile.dart';
import 'package:verified_devnet/starter/askmenu.dart';

class ProjectCard {
  int? projectId;
  String developerName;
  String projectName;
  String timeRequired;
  String gitLink;
  String techStack;
  String type;
  String status;

  ProjectCard({
    this.projectId,
    required this.developerName,
    required this.projectName,
    required this.timeRequired,
    required this.gitLink,
    required this.techStack,
    required this.type,
    this.status = 'Unverified',
  });

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'developerName': developerName,
      'projectName': projectName,
      'timeRequired': timeRequired,
      'gitLink': gitLink,
      'techStack': techStack,
      'type': type,
      'status': status,
    };
  }
}

class DevHome extends StatefulWidget {
  final String loggedUser;
  const DevHome({
    required this.loggedUser,
    super.key,
  });

  @override
  State<DevHome> createState() => _DevHomeState();
}

String _type = 'Individual';
List projectCardList = [];

class _DevHomeState extends State<DevHome> {
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
    print(_searchedItems);
  }

  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _timeRequiredController = TextEditingController();
  final TextEditingController _gitLinkController = TextEditingController();
  final TextEditingController _techStackController = TextEditingController();

  // void devDataFetch() async {
  //   projectCardList = await getProjectCards();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // devDataFetch();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
        leading: ClipOval(
          child: Image.asset(
            'assets/images/abhishek.jpeg',
          ),
        ),
        title: Text(
          widget.loggedUser,
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
                itemCount: projectCardList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                    ),
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
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                myBottomSheet(true, projectCardList[index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                deleteConfirmation(projectCardList[index]);
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
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
                                          text: projectCardList[index].gitLink,
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
                                          text:
                                              projectCardList[index].techStack,
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
                                    height: 10,
                                  ),
                                  (projectCardList[index].status == 'Verified')
                                      ? Container(
                                          width: 105,
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
                                              const Icon(
                                                Icons.verified_rounded,
                                                size: 25,
                                                color: Colors.green,
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          width: 125,
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
                                              const Icon(
                                                Icons.close,
                                                size: 25,
                                                color: Colors.red,
                                              )
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        onPressed: () {
          setState(() {});
          myBottomSheet(false);
          clearController();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(118, 70, 177, 1),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Color.fromRGBO(43, 217, 254, 1.0),
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const UserProfile(
                        index: 0,
                        isDeveloper: true,
                      );
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
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
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white),
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
                child: Center(
                  child: Text(
                    'Log-Out',
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white),
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

  void myBottomSheet(bool isEdit, [ProjectCard? obj]) {
    if (isEdit) {
      _projectNameController.text = obj!.projectName;
      _timeRequiredController.text = obj.timeRequired;
      _gitLinkController.text = obj.gitLink;
      _techStackController.text = obj.techStack;
      _type = obj.type;
    }
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
                              'Add project',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project Name:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _projectNameController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Time Required:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _timeRequiredController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Gitlink:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _gitLinkController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Tech-Stack:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _techStackController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Type:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const BottomSheetIssue(),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_projectNameController.text
                                          .trim()
                                          .isNotEmpty &&
                                      _gitLinkController.text
                                          .trim()
                                          .isNotEmpty &&
                                      _techStackController.text
                                          .trim()
                                          .isNotEmpty &&
                                      _timeRequiredController.text
                                          .trim()
                                          .isNotEmpty) {
                                    if (!isEdit) {
                                      ProjectCard newObj = ProjectCard(
                                        developerName: widget.loggedUser,
                                        projectName:
                                            _projectNameController.text,
                                        timeRequired:
                                            _timeRequiredController.text,
                                        gitLink: _gitLinkController.text,
                                        techStack: _techStackController.text,
                                        type: _type,
                                      );
                                      await insertProjectCard(newObj);
                                      setState(() {});
                                    } else {
                                      setState(() async {
                                        editCard(obj);
                                        projectCardList =
                                            await getProjectCards();
                                      });
                                    }
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                          ],
                        ),
                      ),
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

  Future insertProjectCard(ProjectCard obj) async {
    await database.insert(
      'projectCardTable',
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    projectCardList = await getProjectCards();
  }

  void deleteProjectCard(ProjectCard obj) async {
    await database.delete(
      'projectCardTable',
      where: 'projectId=?',
      whereArgs: [obj.projectId],
    );
    projectCardList = await getProjectCards();
    setState(() {});
  }

  // ================== CONFIRM LOGOUT ===================
  Future<void> deleteConfirmation(ProjectCard obj) async {
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
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white),
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
                    'Delete',
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              onPressed: () {
                deleteProjectCard(obj);
                Navigator.pop(context);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  void clearController() {
    _projectNameController.clear();
    _gitLinkController.clear();
    _timeRequiredController.clear();
    _techStackController.clear();
    _type = 'Individual';
  }

  void editCard(ProjectCard? obj) async {
    ProjectCard editedObj = ProjectCard(
      projectId: obj!.projectId,
      developerName: obj.developerName,
      projectName: _projectNameController.text,
      timeRequired: _timeRequiredController.text,
      gitLink: _gitLinkController.text,
      techStack: _techStackController.text,
      type: _type,
    );
    await database.update(
      'projectCardTable',
      editedObj.toMap(),
      where: 'projectId=?',
      whereArgs: [obj.projectId],
    );
    Navigator.pop(context);
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

Future getProjectCards() async {
  List<Map<String, dynamic>> cardsListOfMap =
      await database.query('projectCardTable');
  return List.generate(
    cardsListOfMap.length,
    (index) {
      return ProjectCard(
        projectId: cardsListOfMap[index]['projectId'],
        developerName: cardsListOfMap[index]['developerName'],
        projectName: cardsListOfMap[index]['projectName'],
        timeRequired: cardsListOfMap[index]['timeRequired'],
        gitLink: cardsListOfMap[index]['gitLink'],
        techStack: cardsListOfMap[index]['techStack'],
        type: cardsListOfMap[index]['type'],
        status: cardsListOfMap[index]['status'],
      );
    },
  );
}

class BottomSheetIssue extends StatefulWidget {
  const BottomSheetIssue({super.key});

  @override
  State<BottomSheetIssue> createState() => _BottomSheetIssueState();
}

class _BottomSheetIssueState extends State<BottomSheetIssue> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: "Individual",
          groupValue: _type,
          onChanged: (value) {
            setState(() {
              _type = value!;
            });
          },
        ),
        Text(
          'Individual',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Radio(
          value: "Group",
          groupValue: _type,
          onChanged: (value) {
            setState(() {
              _type = value!;
            });
          },
        ),
        Text(
          'Group',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
