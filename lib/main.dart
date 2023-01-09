import 'package:flutter/material.dart';

import 'helper/api_helper.dart';
import 'models/currency_models.dart';

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
  String initialcounteryto = "INR";
  String initialcountryfrom = "USD";

  TextEditingController amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CURRENCY CONVERTOR"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: CurrencyAPIHelpers.currencyAPIHelpers.featchcurrencydata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Currency? data = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "From:",
                      style: TextStyle(fontSize: 23),
                    ),
                    DropdownButton(
                        value: initialcountryfrom,
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "INR",
                            child: Text(
                              "India",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "CNY",
                            child: Text("China",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          DropdownMenuItem(
                            value: "USD",
                            child: Text("USA",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                        onChanged: (val) {
                          setState(() {
                            initialcountryfrom = val.toString();
                            CurrencyAPIHelpers.currencyAPIHelpers.from =
                                val.toString();
                          });
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "To:",
                      style: TextStyle(fontSize: 23),
                    ),
                    DropdownButton(
                        value: initialcounteryto,
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "INR",
                            child: Text("India",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          DropdownMenuItem(
                            value: "CNY",
                            child: Text("China",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          DropdownMenuItem(
                            value: "USD",
                            child: Text("USA",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                        onChanged: (val) {
                          setState(() {
                            initialcounteryto = val.toString();

                            CurrencyAPIHelpers.currencyAPIHelpers.to =
                                val.toString();
                          });
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    child: TextFormField(
                      controller: amountcontroller,
                      decoration: InputDecoration(hintText: "Enter Amount"),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        setState(() {
                          CurrencyAPIHelpers.currencyAPIHelpers.value = val;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total Amount:",
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      "${data!.result}",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
