import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnerapp/Screens/login_screen.dart';
import 'package:learnerapp/Screens/edit_profile.dart';
import 'package:learnerapp/Screens/topicsuser.dart';
import '../Services/allsub_api.dart';
import '../Services/module_by_sub.dart';
import 'profile_page.dart';

// ignore: must_be_immutable
class ModuleByUser extends StatefulWidget {
  String? token2;
String ? id;
  ModuleByUser({this.token2,this.id ,super.key});

  @override
  // ignore: no_logic_in_create_state
  State<ModuleByUser> createState() => _ModuleByUserState(token2,id);
}

class _ModuleByUserState extends State<ModuleByUser> {
  String? token2;
  String ? id;
  _ModuleByUserState(this.token2,this.id);
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    getdata();
  }

  Future<ModuleBySubjects> getdata() async {
    // ignore: unused_local_variable
    var params = {"token": "$token2", "id": id};
    var response2 = await http.get(
      Uri.parse(
        'http://fca.systemiial.com/api/get-modules-by-subject?token=$token2&id=$id',
      ),
    );
    var client = http.Client();
    // print(response2.body);
    var data = jsonDecode(response2.body.toString());

    print("Homepage token recieved:   $token2");
    print("MainHomePage Response:     ${response2.body}");

    if (response2.statusCode == 200) {
      //  setState(() {
      //   Token3= data["access_token"];
      // });
      // print("This is my token:  $Token3");
      return ModuleBySubjects.fromJson(data);
    } else {
      return ModuleBySubjects.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(
              color: Color(0xff0b5e54),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Image.asset(
                'images/elevatelogo.png',
                height: 230,
                width: 200,
              ),
            ),
            leading: const BackButton(
              color: Colors.black, // <-- SEE HERE
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(right: 48),
            //     child: Icon(
            //       Icons.menu,
            //       size: 40,
            //       color: const Color(0xFF045a4f),
            //     ),
            //   ),
            // ],
          ),
          endDrawer: Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 80),
            child: Drawer(
              backgroundColor: const Color(0xff0b5e54),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
              ),
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  // const UserAccountsDrawerHeader( // <-- SEE HERE
                  //   decoration: BoxDecoration(color: const Color(0xffffff)),
                  //   accountName: Text(
                  //     "hoome",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   accountEmail: Text(
                  //     "pin@gmail.com",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   currentAccountPicture: FlutterLogo(),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(right: 160),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                          width: 30.0,
                          height: 140.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("images/logocircle.png")))),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile2(token4: token2)),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 40,
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Text(
                              "View Profile",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: const Icon(Icons.arrow_forward,
                                  size: 25, color: Colors.white))
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 155, 156, 156),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text("Log out"),
                                content: const Text("Are you sure to logout?"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"))
                                ],
                              ));
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const LoginScreen()),
                      // );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 350,
                      height: 40,
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: const Text(
                              "Log out",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: const Icon(Icons.arrow_forward,
                                  size: 25, color: Colors.white))
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 155, 156, 156),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    // width: 10,
                    // height: 100,
                    child: Image.asset(
                      "images/elevatelogo.png",
                      width: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder<ModuleBySubjects>(
                      future: getdata(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ListTile(
                                  //   title: Text(snapshot.data!.data![index].name!),
                                  //   subtitle: Text(snapshot.data!.data![index].description!),
                                  // ),
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                      height: 240,
                                      width: 380,
                                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        )
                                            //set border radius more than 50% of height and width to make circle
                                            ),
                                        color: const Color(0xff0b5e54),
                                        margin: const EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 40),
                                                child: RotatedBox(
                                                    quarterTurns: 3,
                                                    child: Center(
                                                      child: Text(
                                                        snapshot.data!
                                                            .data![index].name!,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )),
                                              ),
                                              decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                  )),
                                              width: 60,
                                              height: double.infinity,
                                            ),
                                        
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              snapshot.data!.data![index]
                                                  .description!,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(14.0),
                                              child: VerticalDivider(
                                                width: 5,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                //ModuleByUser
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TopicByUser(
                                                            token2: token2,id: id
                                                          )),
                                                );
                                              },
                                              child: Text(
                                                'View Deck',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              );
                           
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}

TextButton button(
  BuildContext context,
  String name,
  Color col,
) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile2()),
      );
    },
    child: Container(
      alignment: Alignment.center,
      width: 350,
      height: 40,
      // ignore: sort_child_properties_last
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 30),
              child: const Icon(Icons.arrow_forward,
                  size: 25, color: Colors.white))
        ],
      ),
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}
