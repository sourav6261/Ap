import 'package:ap_enterprises/api/loginapi.dart';
import 'package:ap_enterprises/screens/home/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  TextEditingController username = TextEditingController();
  TextEditingController pasword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Rectangle 356.jpg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 40,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 480,
                    width: screenSize.width / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 25),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Center(
                            //       child: Column(
                            //         children: [
                            //           Row(
                            //             children: [
                            //               Image.asset("assets/AP.png"),
                            //             ],
                            //           ),
                            //           const Text(
                            //             "EnterPriser",
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.bold),
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const Text(
                              "Welcome!",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Please log into your account"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Username"),
                            const SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                              controller: username,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text("Pasword"),
                            const SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                              controller: pasword,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Enter password here",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              obscureText: _obscureText,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  width: screenSize.width / 3,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black),
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Demo()));
                                        // await callloginApi();
                                      },
                                      child: const Text("Login")),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  callloginApi() {
    final service = ApiServices();

    service.apiCallLogin(
        {"userName": username.text, "password": pasword.text}).then((value) {
      if (value.error != null) {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => const Demo()));
        print("get data" + value.error!);
      } else {
        print(value.token);

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => const Demo()));
      }
    });
  }
}
