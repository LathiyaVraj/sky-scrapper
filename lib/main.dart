import 'package:flutter/material.dart';

import 'api_helper.dart';
import 'cases_model.dart';

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
        title: Text("CORONA CASES"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: CoronaCaseAPIheplers.coronaCaseAPIheplers.featchapidata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            Text("ERROR: ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Coronacase?> data = snapshot.data;

            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                  offset: Offset(-1, -1)),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 150,
                                width: 140,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage("${data[i]?.countrylogo}"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "  Country: ${data[i]?.countryname}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "  Active Cases: ${data[i]?.activecase}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "  Total Cases: ${data[i]?.totalcase}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
