// import 'package:flutter/material.dart';

// class Glassnumcontainer extends StatelessWidget {
//   final List<String> numofglass;
//   final ValueNotifier<String> selectedItemNotifier;

//   const Glassnumcontainer({super.key, 
//     required this.numofglass,
//     required this.selectedItemNotifier,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 90, top: 250),
//       child: Container(
//         height: 70,
//         width: 200,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const Text('Number of Glasses'),
//                 SingleChildScrollView(
//                   child: DropdownButton<String>(
//                     value: selectedItemNotifier.value,
//                     items: numofglass.map((item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(item, style: const TextStyle(fontSize: 18)),
//                       );
//                     }).toList(),
//                     onChanged: (item) {
//                       selectedItemNotifier.value = item!;
//                     },
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }