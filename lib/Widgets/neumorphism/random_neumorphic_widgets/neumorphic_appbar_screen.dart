import 'package:flutter/material.dart' hide BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as bs;

// Custom Neumorphic Screen
class NeumorphicPractice5 extends StatelessWidget {
  const NeumorphicPractice5({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        // appBar: AppBar(
        //   shadowColor: Colors.grey[300]!,
        //   //Colors.blue,
        //   // shape:
        //   // RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //   backgroundColor: Colors.grey[100],
        //   title: Container(
        //     padding: const EdgeInsets.fromLTRB(10.0, 10.0, 16.0, 16.0),
        //     //alignment: Alignment.bottomRight,
        //     //height: 300,
        //     //width: 300,
        //     decoration: bs.BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       color: Colors.red,
        //       // Colors.grey[100],
        //       boxShadow: [
        //         // Right Shadow
        //         bs.BoxShadow(
        //             offset: const Offset(5, 5),
        //             color: Colors.grey[300]!,
        //             inset: false),
        //         // Left Shadow
        //         const bs.BoxShadow(
        //             offset: Offset(-5, -5), color: Colors.white, inset: true),
        //       ],
        //     ),
        // child: const Center(
        //   child: Text(
        //     'Custom Neumorphic Design',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        //   ),
        // ),

        ////////////////////

        body: Center(
          child: Column(
            children: [
              // Custom Neumorphic App Bar
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 16.0, 16.0),
                  //alignment: Alignment.bottomRight,
                  height: 50,
                  width: 340,
                  decoration: bs.BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100],
                    boxShadow: [
                      // Right Shadow
                      bs.BoxShadow(
                          offset: const Offset(3, 3),
                          color: Colors.grey[300]!,
                          inset: false),
                      // Left Shadow
                      const bs.BoxShadow(
                          offset: Offset(-3, -3),
                          color: Colors.white,
                          inset: false),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Custom Neumorphic Design',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              // Screen
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 16.0, 16.0),
                //alignment: Alignment.bottomRight,
                height: 300,
                width: 300,
                decoration: bs.BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[100],
                  boxShadow: [
                    // Right Shadow
                    bs.BoxShadow(
                        offset: const Offset(5, 5),
                        color: Colors.grey[300]!,
                        inset: true),
                    // Left Shadow
                    const bs.BoxShadow(
                        offset: Offset(-5, -5),
                        color: Colors.white,
                        inset: true),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 12.0, 0.0),
                      alignment: Alignment.topRight,
                      child: const Text(
                        '31 + 11',
                        style: TextStyle(fontSize: 26.0),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          '42',
                          style: TextStyle(fontSize: 26.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
