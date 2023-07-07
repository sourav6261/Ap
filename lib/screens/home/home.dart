import 'package:ap_enterprises/screens/home/history/history.dart';
import 'package:flutter/material.dart';

import 'invoice/invoice.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Rectangle 354.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 190, vertical: 10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "WELCOME USER!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      width: screenSize.width / 0.2,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: TabBar(
                                unselectedLabelColor: Colors.black,
                                labelColor: Colors.white,
                                indicatorColor: Colors.white,
                                indicatorWeight: 2,
                                indicator: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 5, 76, 123),
                                    borderRadius: BorderRadius.circular(5)),
                                controller: tabController,
                                tabs: const [
                                  Tab(
                                    text: "Create Invoice",
                                  ),
                                  Tab(
                                    text: "History",
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          TabOne(),
                          TabTwo(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
