import "package:flutter/material.dart";

final images = [
  "assets/seinen.png",
  "assets/isekai.jpeg",
  "assets/sololvl.jpeg",
  "assets/sol.jpeg",
  // "assets/harem.webp",
  // "assets/seinen.png",
  // "assets/isekai.jpeg",
  // "assets/sololvl.jpeg",
  // "assets/sol.jpeg",
];

class ComplexLayoutExample extends StatelessWidget {
  const ComplexLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working With Complex Layouts"),
      ),
      body: Container(
        clipBehavior: Clip.hardEdge, // force child to take the shape of parent container
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.15),
              blurRadius: 1,
              spreadRadius: 3,
            ),
          ],
        ),
        child: images.length == 1
            ? Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(images[0]).image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : images.length == 2
                ? SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        ImageContainer(imagePath: images[0]),
                        const SizedBox(
                          width: 6,
                        ),
                        ImageContainer(imagePath: images[1]),
                      ],
                    ),
                  )
                : images.length == 3
                    ? SizedBox(
                        height: 150,
                        child: Row(
                          children: [
                            ImageContainer(imagePath: images[0]),
                            const SizedBox(
                              width: 6,
                            ),
                            ImageContainer(imagePath: images[1]),
                            const SizedBox(
                              width: 6,
                            ),
                            ImageContainer(imagePath: images[2]),
                          ],
                        ),
                      )
                    : images.length == 4
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 150,
                                child: Row(
                                  children: [
                                    ImageContainer(imagePath: images[0]),
                                    const SizedBox(width: 6),
                                    ImageContainer(imagePath: images[1]),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 150,
                                child: Row(
                                  children: [
                                    ImageContainer(imagePath: images[2]),
                                    const SizedBox(width: 6),
                                    ImageContainer(imagePath: images[3]),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : images.length == 5
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: Row(
                                      children: [
                                        ImageContainer(imagePath: images[0]),
                                        const SizedBox(width: 6),
                                        ImageContainer(imagePath: images[1]),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    height: 150,
                                    child: Row(
                                      children: [
                                        ImageContainer(imagePath: images[2]),
                                        const SizedBox(width: 6),
                                        ImageContainer(imagePath: images[3]),
                                        const SizedBox(width: 6),
                                        ImageContainer(imagePath: images[4]),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : images.length == 6
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        child: Row(
                                          children: [
                                            ImageContainer(imagePath: images[0]),
                                            const SizedBox(width: 6),
                                            ImageContainer(imagePath: images[1]),
                                            const SizedBox(width: 6),
                                            ImageContainer(imagePath: images[2]),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      SizedBox(
                                        height: 150,
                                        child: Row(
                                          children: [
                                            ImageContainer(imagePath: images[3]),
                                            const SizedBox(width: 6),
                                            ImageContainer(imagePath: images[4]),
                                            const SizedBox(width: 6),
                                            ImageContainer(imagePath: images[5]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : images.length == 7
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 150,
                                            child: Row(
                                              children: [
                                                ImageContainer(imagePath: images[0]),
                                                const SizedBox(width: 6),
                                                ImageContainer(imagePath: images[1]),
                                                const SizedBox(width: 6),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          SizedBox(
                                            height: 150,
                                            child: Row(
                                              children: [
                                                ImageContainer(imagePath: images[2]),
                                                const SizedBox(width: 6),
                                                ImageContainer(imagePath: images[3]),
                                                const SizedBox(width: 6),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            height: 150,
                                            child: Row(
                                              children: [
                                                ImageContainer(imagePath: images[4]),
                                                const SizedBox(width: 6),
                                                ImageContainer(imagePath: images[5]),
                                                const SizedBox(width: 6),
                                                ImageContainer(imagePath: images[6]),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : images.length == 8
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    ImageContainer(imagePath: images[0]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(imagePath: images[1]),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              SizedBox(
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    ImageContainer(imagePath: images[2]),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    ImageContainer(imagePath: images[3]),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    ImageContainer(imagePath: images[4]),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              SizedBox(
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    ImageContainer(imagePath: images[5]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(imagePath: images[6]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(imagePath: images[7]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : images.length == 9
                                            ? Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: 150,
                                                    child: Row(
                                                      children: [
                                                        ImageContainer(imagePath: images[0]),
                                                        const SizedBox(width: 6),
                                                        ImageContainer(imagePath: images[1]),
                                                        const SizedBox(width: 6),
                                                        ImageContainer(imagePath: images[2]),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  SizedBox(
                                                    height: 150,
                                                    child: Row(
                                                      children: [
                                                        ImageContainer(imagePath: images[3]),
                                                        const SizedBox(width: 6),
                                                        ImageContainer(imagePath: images[4]),
                                                        const SizedBox(width: 6),
                                                        ImageContainer(imagePath: images[5]),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  SizedBox(
                                                    height: 150,
                                                    child: Row(
                                                      children: [
                                                        ImageContainer(imagePath: images[6]),
                                                        const SizedBox(width: 6),
                                                        ImageContainer(imagePath: images[7]),
                                                        const SizedBox(width: 6),
                                                        ImageContainer(imagePath: images[8]),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        clipBehavior: Clip.hardEdge, // force child to take the shape of parent container
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              imagePath,
            ).image,
          ),
        ),
      ),
    );
  }
}
// TODO: move to journal app

// class ComplexLayoutExample extends StatelessWidget {
//   const ComplexLayoutExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Working With Complex Layouts"),
//       ),
//       body: Container(
//         clipBehavior: Clip.hardEdge, // force child to take the shape of parent container
//         margin: const EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(16),
//           ),
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 2),
//               color: Colors.black.withOpacity(0.15),
//               blurRadius: 1,
//               spreadRadius: 3,
//             ),
//           ],
//         ),
//         child: images.length == 1
//             ? Container(
//                 height: 200,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: Image.asset(images[0]).image,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               )
//             : images.length == 2
//                 ? SizedBox(
//                     height: 200,
//                     child: Row(
//                       children: [
//                         ImageContainer(imagePath: images[0]),
//                         const SizedBox(
//                           width: 6,
//                         ),
//                         ImageContainer(imagePath: images[1]),
//                       ],
//                     ),
//                   )
//                 : images.length == 3
//                     ? SizedBox(
//                         height: 150,
//                         child: Row(
//                           children: [
//                             ImageContainer(imagePath: images[0]),
//                             const SizedBox(
//                               width: 6,
//                             ),
//                             ImageContainer(imagePath: images[1]),
//                             const SizedBox(
//                               width: 6,
//                             ),
//                             ImageContainer(imagePath: images[2]),
//                           ],
//                         ),
//                       )
//                     : images.length == 4
//                         ? Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               SizedBox(
//                                 height: 150,
//                                 child: Row(
//                                   children: [
//                                     ImageContainer(imagePath: images[0]),
//                                     const SizedBox(width: 6),
//                                     ImageContainer(imagePath: images[1]),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 6),
//                               SizedBox(
//                                 height: 150,
//                                 child: Row(
//                                   children: [
//                                     ImageContainer(imagePath: images[2]),
//                                     const SizedBox(width: 6),
//                                     ImageContainer(imagePath: images[3]),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         : images.length == 5
//                             ? Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   SizedBox(
//                                     height: 150,
//                                     child: Row(
//                                       children: [
//                                         ImageContainer(imagePath: images[0]),
//                                         const SizedBox(width: 6),
//                                         ImageContainer(imagePath: images[1]),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 6),
//                                   SizedBox(
//                                     height: 150,
//                                     child: Row(
//                                       children: [
//                                         ImageContainer(imagePath: images[2]),
//                                         const SizedBox(width: 6),
//                                         ImageContainer(imagePath: images[3]),
//                                         const SizedBox(width: 6),
//                                         ImageContainer(imagePath: images[4]),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : images.length == 6
//                                 ? Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         height: 150,
//                                         child: Row(
//                                           children: [
//                                             ImageContainer(imagePath: images[0]),
//                                             const SizedBox(width: 6),
//                                             ImageContainer(imagePath: images[1]),
//                                             const SizedBox(width: 6),
//                                             ImageContainer(imagePath: images[2]),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 6),
//                                       SizedBox(
//                                         height: 150,
//                                         child: Row(
//                                           children: [
//                                             ImageContainer(imagePath: images[3]),
//                                             const SizedBox(width: 6),
//                                             ImageContainer(imagePath: images[4]),
//                                             const SizedBox(width: 6),
//                                             ImageContainer(imagePath: images[5]),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 : images.length == 7
//                                     ? Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           SizedBox(
//                                             height: 150,
//                                             child: Row(
//                                               children: [
//                                                 ImageContainer(imagePath: images[0]),
//                                                 const SizedBox(width: 6),
//                                                 ImageContainer(imagePath: images[1]),
//                                                 const SizedBox(width: 6),
//                                               ],
//                                             ),
//                                           ),
//                                           const SizedBox(height: 6),
//                                           SizedBox(
//                                             height: 150,
//                                             child: Row(
//                                               children: [
//                                                 ImageContainer(imagePath: images[2]),
//                                                 const SizedBox(width: 6),
//                                                 ImageContainer(imagePath: images[3]),
//                                                 const SizedBox(width: 6),
//                                               ],
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 6,
//                                           ),
//                                           SizedBox(
//                                             height: 150,
//                                             child: Row(
//                                               children: [
//                                                 ImageContainer(imagePath: images[4]),
//                                                 const SizedBox(width: 6),
//                                                 ImageContainer(imagePath: images[5]),
//                                                 const SizedBox(width: 6),
//                                                 ImageContainer(imagePath: images[6]),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     : images.length == 8
//                                         ? Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               SizedBox(
//                                                 height: 150,
//                                                 child: Row(
//                                                   children: [
//                                                     ImageContainer(imagePath: images[0]),
//                                                     const SizedBox(width: 6),
//                                                     ImageContainer(imagePath: images[1]),
//                                                     const SizedBox(
//                                                       width: 6,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 6),
//                                               SizedBox(
//                                                 height: 150,
//                                                 child: Row(
//                                                   children: [
//                                                     ImageContainer(imagePath: images[2]),
//                                                     const SizedBox(
//                                                       width: 6,
//                                                     ),
//                                                     ImageContainer(imagePath: images[3]),
//                                                     const SizedBox(
//                                                       width: 6,
//                                                     ),
//                                                     ImageContainer(imagePath: images[4]),
//                                                   ],
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 6),
//                                               SizedBox(
//                                                 height: 150,
//                                                 child: Row(
//                                                   children: [
//                                                     ImageContainer(imagePath: images[5]),
//                                                     const SizedBox(width: 6),
//                                                     ImageContainer(imagePath: images[6]),
//                                                     const SizedBox(width: 6),
//                                                     ImageContainer(imagePath: images[7]),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         : images.length == 9
//                                             ? Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   SizedBox(
//                                                     height: 150,
//                                                     child: Row(
//                                                       children: [
//                                                         ImageContainer(imagePath: images[0]),
//                                                         const SizedBox(width: 6),
//                                                         ImageContainer(imagePath: images[1]),
//                                                         const SizedBox(width: 6),
//                                                         ImageContainer(imagePath: images[2]),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 6),
//                                                   SizedBox(
//                                                     height: 150,
//                                                     child: Row(
//                                                       children: [
//                                                         ImageContainer(imagePath: images[3]),
//                                                         const SizedBox(width: 6),
//                                                         ImageContainer(imagePath: images[4]),
//                                                         const SizedBox(width: 6),
//                                                         ImageContainer(imagePath: images[5]),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 6),
//                                                   SizedBox(
//                                                     height: 150,
//                                                     child: Row(
//                                                       children: [
//                                                         ImageContainer(imagePath: images[6]),
//                                                         const SizedBox(width: 6),
//                                                         ImageContainer(imagePath: images[7]),
//                                                         const SizedBox(width: 6),
//                                                         ImageContainer(imagePath: images[8]),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )
//                                             : SizedBox(),
//       ),
//     );
//   }
// }

// class ImageContainer extends StatelessWidget {
//   final String imagePath;

//   const ImageContainer({required this.imagePath, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       flex: 1,
//       child: Container(
//         clipBehavior: Clip.hardEdge, // force child to take the shape of parent container
//         height: double.maxFinite,
//         width: double.maxFinite,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(16),
//           ),
//         ),
//         child: Image.asset(
//           imagePath,
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
