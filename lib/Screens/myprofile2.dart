import 'package:flutter/material.dart';
class Profile2 extends StatelessWidget {
  const Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
     
                
          title: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20),
            child: Image.asset(
              'images/elevatelogo.png',
              height: 230,
              width: 200,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 48,top: 16),
              child: Icon(
                Icons.menu,
                size: 40,
                color: const Color(0xFF045a4f),
              ),
            ),
          ],
        ), 
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
             SizedBox(width: 30,),
             Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff0b5e54),
              width: 4

            )
          )
        ),
          child: Text(
        "My Profile",
        style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            ),
      ))
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 270,
              width: 380,
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  //set border radius more than 50% of height and width to make circle
                ),
                color: Color(0xff0b5e54),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 150,
                          width: 150,
                          child: Image.asset('images/logocircle.png'),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'YOUR NAME',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'JHON SMITH',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'EMAIL ADDRESS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'johansmith@gmail.com',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'SELECT SUUBJECT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ShowAnswer()),
                                    // );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 20,
                                    child: const Text(
                                      'Chemistry',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 167, 166, 166),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ShowAnswer()),
                                    // );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 20,
                                    child: const Text(
                                      'Chemistry',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 167, 166, 166),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            button(context, "EDIT PROFILE", Color(0xff0b5e54)),
            button(context, "CHANGE PASSWORD", Color(0xff0b5e54)),
            button(context, "DELETE ACCOUNT", Colors.pink),
          ],
        ),
      ),
    );
  }

  TextButton button(
    BuildContext context,
    String name,
    Color col,
  ) {
    return TextButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Drawers()),
        // );
      },
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 30),
                child: Icon(Icons.arrow_forward, size: 25, color: Colors.grey))
          ],
        ),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}