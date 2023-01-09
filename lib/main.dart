import 'package:flutter/material.dart';
import 'package:skyscrapper3/people_model.dart';

import 'api_helper.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RANDOM PEOPLE"),
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: RandomAPIhelpler.randomAPIhelpler.featchAPIData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR :  ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Random? data = snapshot.data;
            return Container(
              color: Colors.brown.shade400,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 99),
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color: Colors.brown.shade100,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 90),
                            const Text(
                              "Personal Detail",
                              style:
                                  TextStyle(color: Colors.brown, fontSize: 22),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name :",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                                Text(
                                  "${data!.first} ${data!.last}",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "AGE :",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                                Text(
                                  "${data!.age}",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Phone Number :",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                                Text(
                                  "${data!.phone}",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Gender :",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                                Text(
                                  "${data!.gender}",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Email :",
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 19),
                                ),
                              ],
                            ),
                            SizedBox(height: 5, width: 20),
                            Text(
                              "${data!.email}",
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 19,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Random? data = snapshot.data;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade600,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 80,
                            backgroundColor: Colors.brown,
                            child: CircleAvatar(
                              maxRadius: 70,
                              backgroundColor: Colors.brown,
                              backgroundImage: NetworkImage("${data?.pic}"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
