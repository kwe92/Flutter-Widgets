// Working With PopUpMenuButton()
//    - Create a pop up menu in the app bar


// class WorkingWithPopUpMenuButton extends StatefulWidget {
//   const WorkingWithPopUpMenuButton({super.key});

//   @override
//   State<WorkingWithPopUpMenuButton> createState() =>
//       _WorkingWithPopUpMenuButtonState();
// }

// class _WorkingWithPopUpMenuButtonState
//     extends State<WorkingWithPopUpMenuButton> {
//   final String title0 = 'Working With PopupMenuButton';
//   final String title1 = 'Title 2';
//   final String title2 = 'Title 3';
//   late String mutableTitle = title0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: FittedBox(child: Text(mutableTitle)),
//           actions: [
//             PopupMenuButton(
//               itemBuilder: (BuildContext context) => [
//                 PopupMenuItem(
//                   value: title0,
//                   child: const Text('Title 1'),
//                 ),
//                 PopupMenuItem(
//                   value: title1,
//                   child: Text(title1),
//                 ),
//                 PopupMenuItem(
//                   value: title2,
//                   child: Text(title2),
//                 ),
//               ],
//               onSelected: (String newValue) {
//                 setState(() {
//                   mutableTitle = newValue;
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
