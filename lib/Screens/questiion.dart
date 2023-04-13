import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learnerapp/Screens/showanswer.dart';
import 'package:learnerapp/Services/question_api.dart';
import 'package:http/http.dart' as http;
import '../Utilities/routes.dart';

class ShowAnswer extends StatefulWidget {
   String? token2;

  ShowAnswer({this.token2, super.key});


  @override
  State<ShowAnswer> createState() => _ShowAnswerState(token2);
}

class _ShowAnswerState extends State<ShowAnswer> {
 
   String? token2;

_ShowAnswerState(this.token2);

  void initState() {
    super.initState();
    getToken();
  }

    Future<QuestionModel> getToken() async {
    var params = {
    "token": "$token2",
    "type": "subject",
    "id": "1",
    };
    var response2 = await http.get(
        Uri.parse(
          'http://fca.systemiial.com/api/get-card?token=$token2&type=subject&id=1',),);
    var client = http.Client();
    // print(response2.body);
    var data = jsonDecode(response2.body.toString());
  
 
  //  studentid =data["data"]["name"];
  
        // response2['data'][]
      print("Question page token recieved:   $token2"); 
      print("Question page Response:     ${response2.body}");
    if (response2.statusCode == 200) {
      //  setState(() {
      //   Token3= data["access_token"];
      // });
      // print("This is my token:  $Token3");
      return  QuestionModel.fromJson(data);
    } else {
      return  QuestionModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
                            

        children: [
         Row(
            children: [ 
              const SizedBox(
                width: 70,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Image(
                  height: 200,
                  image: AssetImage('images/elevatelogo.png'),
                ),
              ),
               Container(
          
                width: 100.0,
                child: const Icon(
                  Icons.menu,
                  size: 37,
                  color: Color(0xff022924),
                ),
              ),
            ],
          ),
          //extra space remove

          Expanded(
            child: Stack(
              children: [
                Positioned(
                   
                    left: 30,
                    width: 320,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff022924),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomRight: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                          )),
                    )),
                Positioned(
                    top: 15,
                    left: 40,
                    width: 320,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff07433b),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomRight: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                          )),
                    )),
                Positioned(
                    top: 25,
                    left: 60,
                    width: 320,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff045a4f),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomRight: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "QUESTION",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Center(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          //Button
           TextButton(
                onPressed: 
                (){
                  Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                  MyAnswers(

                                                    AnsToken: token2,
                                                  )
                                                          
                                                          ),
                                                );
                },
                              
                child: Container(
                  alignment: Alignment.center,
                  width: 350,
                  height: 50,
                  child: const Text(
                    'Show Answer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

              ),
        ],
      ),
    );
  }
}