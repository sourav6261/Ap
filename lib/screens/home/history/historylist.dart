import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 300),
        child: ListView.builder(
          itemCount: 108,
          itemBuilder: (
            BuildContext context,
            int intex,
          ) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: screenSize.width / 2,
                      padding: const EdgeInsets.only(top: 0, left: 9, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 220, 230, 238),
                        ),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Invoice: ${intex + 1}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Dr. Anil Kadam",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "26.05.2023",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
