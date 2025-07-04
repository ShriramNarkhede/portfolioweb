// //certificate widget
// Widget CertificateContainer(){
//   return Expanded(
//       flex: 1,
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         height: 250,
//         width: 350,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               spreadRadius: 5,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,

//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Getting started with Flutter",
//                             style: GoogleFonts.poppins(
//                               fontSize: 26,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text(
//                                 "Infosys",
//                                 style: TextStyle(color: Colors.blue, fontSize: 16),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 "AUG 2023",
//                                 style: TextStyle(color: Colors.blue, fontSize: 14),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Text("Skills: Flutter, Dart",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               )),
//                           const SizedBox(height: 10),
//                               ElevatedButton(
//                                 onPressed: (){},
//                               child: Text("View Certificate")),
//                         ],
//                       ),
//           ),
//         ),
//       ),
//   );
// }