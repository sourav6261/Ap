// import 'dart:convert';

// import 'package:ap_enterprises/model/invoicemodel/getinvoice.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Let extends StatelessWidget {
//   const Let({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   fetchUser().then((user) {
//                     print("it's ok ");
//                   }).catchError((error) {
//                     print("Error :${error.toString()}");
//                   });
//                 },
//                 child: const Text("Get")),
//             Expanded(child: FutureBuilder<User>(
//               // future: getData(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ElevatedButton(
//                       onPressed: () async {
//                         fetchUser().then((user) {
//                           // Data retrieval successful, you can access the user object here
//                           print("it's ok ");
//                         }).catchError((error) {
//                           print("Error :${error.toString()}");
//                           // Error occurred while fetching data
//                         });
//                       },
//                       child: const Text("Get"));
//                 } else {
//                   return Center(
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 100,
//                         ),
//                         const CircularProgressIndicator(),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(snapshot.toString())
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ))
//           ],
//         ),
//       ),
//     );
//   }

// //   Future<User> getData() async {
// //     final response = await http.get(Uri.parse(
// //         'https://server-dot-sanjoli-sarees-testenvironment.el.r.appspot.com/getInvoice'));
// //     var data = jsonDecode(response.body.toString());
// //     if (response.statusCode == 200) {
// //       return User.fromJson(data);
// //     } else {
// //       return User.fromJson(data);
// //     }
// //   }
// // }
//   Future<User> fetchUser() async {
//     final response = await http.get(Uri.parse(
//         'https://server-dot-sanjoli-sarees-testenvironment.el.r.appspot.com/getInvoice'));

//     if (response.statusCode == 200) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to fetch user data');
//     }
//   }
// }
