import 'package:ap_enterprises/screens/home/history/historylist.dart';
import 'package:flutter/material.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});

  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo> {
  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black12,
      // appBar: AppBar(
      //   title: const Text('History'),
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 0,
          ),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: screenSize.width / 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 220, 230, 238)),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Sun City"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("26 may, 2023"),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Invoices${index + 1}"),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 35,
                                    width: screenSize.width / 9,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Test()));
                                        },
                                        child: const Text("View Invoice")),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
