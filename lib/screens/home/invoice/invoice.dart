import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TabOne extends StatefulWidget {
  const TabOne({super.key});

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController advController = TextEditingController();
  final TextEditingController totelController = TextEditingController();
  DateTime date = DateTime(2023, 6, 23);
  List<TextEditingController> listController = [TextEditingController()];
  String? dropdownvalue = 'Gulmohar Society';
  var items = [
    'Gulmohar Society',
    'Unnamed Project',
    'Paradise Mansion',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 700,
                        width: screenSize.width / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 30, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Invoice No : 001",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        DateTime? newDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: date,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                        );
                                        if (newDate == null) return;
                                        setState(() => date = newDate);
                                      },
                                      child: Text(
                                        "${date.year}/${date.month}/${date.day}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ))
                                ],
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [Text("Bill To")],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Name",
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: addressController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Address of the Recipient",
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              // Container(
                              //   height: 20,
                              //   width: screenSize.width / 2,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: const [
                              //       Text("s.No"),
                              //       Text("Item Description"),
                              //       Text("Quantity"),
                              //       Text("Unit Price"),
                              //       Text("Total"),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: DropdownButton(
                                    // Initial Value
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    value: dropdownvalue,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),

                              Container(
                                height: 200,
                                width: screenSize.width / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  shrinkWrap: true,
                                  itemCount: listController.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: const [
                                                Text("s.No"),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Text("Item Description"),
                                                SizedBox(
                                                  width: 124,
                                                ),
                                                Text("Quantity"),
                                                SizedBox(
                                                  width: 103,
                                                ),
                                                Text("Unit Price"),
                                                SizedBox(
                                                  width: 112,
                                                ),
                                                Text("Total"),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  height: 60,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                            child: Flexible(
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        hintText:
                                                                            "00"),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                11,
                                                            child: Flexible(
                                                                child:
                                                                    TextFormField(
                                                              controller:
                                                                  descriptionController,
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Description"),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                            child: Flexible(
                                                                child:
                                                                    TextFormField(
                                                              controller:
                                                                  quantityController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      hintText:
                                                                          "00"),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                            child: Flexible(
                                                                child:
                                                                    TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      hintText:
                                                                          "00"),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                            child: Flexible(
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        hintText:
                                                                            ""),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: const [
                                                Text("s.No"),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                                Text("Item Description"),
                                                SizedBox(
                                                  width: 124,
                                                ),
                                                Text("Quantity"),
                                                SizedBox(
                                                  width: 103,
                                                ),
                                                Text("Unit Price"),
                                                SizedBox(
                                                  width: 112,
                                                ),
                                                Text("Total"),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 0),
                                                  height: 60,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                            child: Flexible(
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        hintText:
                                                                            "00"),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                11,
                                                            child: Flexible(
                                                                child:
                                                                    TextFormField(
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Description"),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                            child: Flexible(
                                                                child:
                                                                    TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      hintText:
                                                                          "00"),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                            child: Flexible(
                                                                child:
                                                                    TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(),
                                                                      hintText:
                                                                          "00"),
                                                            )),
                                                          ),
                                                          SizedBox(
                                                            width: screenSize
                                                                    .width /
                                                                23,
                                                          ),
                                                          SizedBox(
                                                            height: 40,
                                                            width: screenSize
                                                                    .width /
                                                                20,
                                                            child: Flexible(
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    const InputDecoration(
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                        hintText:
                                                                            ""),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 35,
                                width: screenSize.width / 9,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black),
                                    onPressed: () {
                                      setState(() {
                                        listController
                                            .add(TextEditingController());
                                      });
                                    },
                                    child: const Text("Add New")),
                              ),

                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 120,
                                width: screenSize.width / 2,
                                padding: const EdgeInsets.only(
                                    top: 20, left: 29, right: 28),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 220, 230, 238),),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Advance Payment"),
                                        SizedBox(
                                          height: 40,
                                          width: screenSize.width / 12,
                                          child: Flexible(
                                            child: TextFormField(
                                              textAlign: TextAlign.right,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "₹00"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Total Amount"),
                                        Text("₹00")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 81, 125, 161)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 35,
                                    width: screenSize.width / 9,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 14, 59, 95)),
                                        onPressed: () async {
                                          // await postData();
                                          // String name = "nameController.text";
                                          // String address =
                                          //     "addressController.text";
                                          // String siteName = "hhhhhhhhh";
                                          // String job =
                                          //     "quantityController.text";
                                          // String discrition =
                                          //     "descriptionController.text";

                                          // String adv = "664";
                                          // String total = "100000000000";
                                          // // int unitPrice =
                                          // //     unitPriceController as int;
                                          // Item? data = await submitData(
                                          //     name,
                                          //     job,
                                          //     siteName,
                                          //     address,
                                          //     discrition,
                                          //     adv,
                                          //     total);
                                          // setState(() {
                                          //   dataModel = data;
                                          // });
                                          await postData();
                                        },
                                        child: const Text("Create Invoice")),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // postData() async {
  //   var responae = await http.post(
  //       Uri.parse(
  //           'https://server-dot-sanjoli-sarees-testenvironment.el.r.appspot.com/createInvoice'),
  //       body: {
  //         "name": nameController.text,
  //         "address": addressController.text,
  //         "siteName": "gggggggggggggg",
  //         "items": {
  //           [
  //             "itemsDiscrition",
  //             descriptionController.text,
  //           ]
  //         }
  //       });
  //   print(responae.body);
  // }
  // Future<Item?> submitData(String name, String job, String discrition,
  //     String address, String siteName, String adv, String total) async {
  //   var response = await http.post(
  //       Uri.https("server-dot-sanjoli-sarees-testenvironment.el.r.appspot.com",
  //           "createInvoice"),
  //       body: {
  //         "name": name,
  //         "address": "hhsff",
  //         //"siteName": siteName,
  //         "items": discrition,
  //         "quantity": job,
  //         "advancePayment": adv,
  //         "totalAmount": total
  //       });
  //   var data = response.body;
  //   print(data);
  //   if (response.statusCode == 201) {
  //     String responseString = response.body;
  //     userFromJson(responseString);
  //   } else
  //     return null;
  // }

  // Future<User> fetchAlbum() async {
  //   final response = await http.post(
  //       Uri.parse(
  //           'https://server-dot-sanjoli-sarees-testenvironment.el.r.appspot.com/createInvoice'),
  //       body: {
  //         "name": "VISHWAS",
  //         "address": "pentagoan 2",
  //         "siteName": "Magarpatta",
  //         "itemsDiscrition": "something",
  //         "quantity": "10",
  //         "unitPrice": "200",
  //         "advancePayment": "45000",
  //         "totalAmount": "90000"
  //       });

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return User.fromJson(jsonDecode(response.body));
  //   } else {
  //     print(response.body);
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<void> postData() async {
    final url = Uri.parse(
        'https://server-dot-sanjoli-sarees-387012.el.r.appspot.com/createInvoice');

    final data = {
      "name": nameController.text,
      "address": addressController.text,
      "siteName": dropdownvalue,
      "items": [
        {
          "itemsDiscrition": descriptionController.text,
          "quantity": quantityController.text,
          "unitPrice": unitPriceController.text,
          //
        },
        {
          "itemsDiscrition": nameController.text,
          "quantity": quantityController.text,
          "unitPrice": unitPriceController.text,
        }
      ],
      "advancePayment": 000,
      "totalAmount": 000
    };

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Request successful, handle the response
      final responseData = response.body;
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const PdfPage()));

      print('Response Data: ${response.body}');
    } else {
      // Request failed, handle the error
      print('Failed to create invoice. Error: ${response.body}');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const PdfPage()));
    }
  }
}
