// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class AnimatedMenu extends StatefulWidget {
//   const AnimatedMenu({super.key});

//   @override
//   State<AnimatedMenu> createState() => _AnimatedMenuState();
// }

// class _AnimatedMenuState extends State<AnimatedMenu> with SingleTickerProviderStateMixin {
//   static const _menuTitles = [
//     'Declarative Style',
//     'Premade Widgets',
//     'Stateful Hot Reload',
//     'Native Performance',
//     'Great Community',
//   ];

//   // TODO: Review

//   // Animation Controller
//   late AnimationController _staggeredController;

//   // Animation Delays
//   static const Duration _initialDelayTime = Duration(milliseconds: 50);

//   static const Duration _itemSlideTime =
//       Duration(milliseconds: 250); //?? why is _itemSlideTime not added to total time? | try with and without

//   static const Duration _staggerTime = Duration(milliseconds: 50);

//   static const Duration _buttonDelayTime = Duration(milliseconds: 150);

//   static const Duration _buttonTime = Duration(milliseconds: 500);

//   final Duration _animationDuration = _initialDelayTime + (_staggerTime * _menuTitles.length) + _buttonDelayTime + _buttonTime;

//   // Animation Intervals
//   final List<Interval> _itemSlideIntervals = [];

//   late Interval _buttonInterval;

//   @override
//   void initState() {
//     super.initState();

//     // TODO: Review

//     _createAnimationIntervals();

//     _staggeredController = AnimationController(
//       vsync: this,
//       duration: _animationDuration,
//     )..forward(); // calling the forward method starts the animation in init state
//   }

//   void _createAnimationIntervals() {
//     _createAnimatedMenuTitleIntervals();
//     _createButtonInterval();
//   }

//   // TODO: Review
//   void _createAnimatedMenuTitleIntervals() {
//     for (int i = 0; i < _menuTitles.length; i++) {
//       final Duration startTime = _initialDelayTime + (_staggerTime * i);

//       final Duration endTime = startTime + _itemSlideTime;

//       final double intervalBegin = (startTime.inMilliseconds / _animationDuration.inMilliseconds);

//       final double intervalEnd = (endTime.inMilliseconds / _animationDuration.inMilliseconds);

//       _itemSlideIntervals.add(Interval(intervalBegin, intervalEnd));
//     }
//   }

//   // TODO: Review
//   void _createButtonInterval() {
//     //?? shouldn't we add _initialDelayTime to buttonStartTime
//     final Duration buttonStartTime =
//         Duration(milliseconds: (_menuTitles.length * _staggerTime.inMilliseconds)) + _buttonDelayTime + _initialDelayTime;

//     final Duration buttonEndTime = buttonStartTime + _buttonDelayTime;

//     final double intervalBegin = (buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds);

//     final double intervalEnd = (buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds);

//     _buttonInterval = Interval(intervalBegin, intervalEnd);
//   }

//   @override
//   void dispose() {
//     _staggeredController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Stack(
//         // fit: StackFit.expand,
//         children: [
//           _buildLogo(),
//           _buildContent(),
//         ],
//       ),
//     );
//   }

//   Widget _buildLogo() => Positioned(
//         left: 70,
//         bottom: 0,
//         child: Opacity(
//           opacity: 0.2,
//           child: SizedBox(
//             width: 425,
//             height: 425,
//             child: SvgPicture.asset(
//               "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/flutter-logo.svg",
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       );

//   Widget _buildContent() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView.separated(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _menuTitles.length,
//                 itemBuilder: (BuildContext context, int i) =>
//                     // ?? Why is AnimatedBuilder used here ? What is an alternate way you could rebuild this widget based on the  _staggeredController?
//                     AnimatedBuilder(
//                   animation: _staggeredController,
//                   builder: (BuildContext context, Widget? child) {
//                     // TODO: Review

//                     final double animationPercent = Curves.easeOut.transform(
//                       _itemSlideIntervals[i].transform(_staggeredController.value),
//                     );

//                     final double opacity = animationPercent;

//                     // the distance the widget slides in relation to the animation percentage
//                     final double slideDistance = (1.0 - animationPercent) * 150;

//                     return Opacity(
//                       opacity: opacity,
//                       child: Transform.translate(
//                         offset: Offset(slideDistance, 0),
//                         child: child,
//                       ),
//                     );
//                   },
//                   child: Text(
//                     _menuTitles[i],
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 separatorBuilder: (BuildContext context, int i) => const SizedBox(height: 32),
//               ),
//             ),
//             _buildButton(),
//           ],
//         ),
//       );

//   Widget _buildButton() => SizedBox(
//         width: double.infinity,
//         child: AnimatedBuilder(
//           animation: _staggeredController,
//           builder: (BuildContext context, Widget? child) {
//             // TODO: Review

//             final double animationPercent = Curves.elasticOut.transform(
//               _buttonInterval.transform(_staggeredController.value),
//             );

//             final double opacity = animationPercent.clamp(0.0, 1.0);

//             final double scale = (animationPercent * 0.5) + 0.5;

//             return Opacity(
//               opacity: opacity,
//               child: Transform.scale(
//                 scale: scale,
//                 child: child,
//               ),
//             );
//           },
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.lightBlue,
//               padding: const EdgeInsets.symmetric(
//                 vertical: 12,
//               ),
//             ),
//             onPressed: () {},
//             child: const Text(
//               "Get Started",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//       );
// }



// // TODO: Write comments and Summarize

// // Interval
