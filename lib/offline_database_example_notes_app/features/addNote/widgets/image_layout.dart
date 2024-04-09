import 'package:flutter/material.dart';

class ImageLayout extends StatelessWidget {
  final void Function(ImageProvider image)? removeImageCallback;
  final List<ImageProvider> images;
  const ImageLayout({
    required this.images,
    this.removeImageCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("ImageLayout images.length: ${images.length}");
    return images.length == 1
        ? SizedBox(
            height: 180,
            child: Column(
              children: [
                ImageContainer(
                  removeImageCallback: removeImageCallback,
                  image: images[0],
                ),
              ],
            ),
          )
        : images.length == 2
            ? SizedBox(
                height: 180,
                child: Row(
                  children: [
                    ImageContainer(
                      removeImageCallback: removeImageCallback,
                      image: images[0],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ImageContainer(
                      removeImageCallback: removeImageCallback,
                      image: images[1],
                    ),
                  ],
                ),
              )
            : images.length == 3
                ? SizedBox(
                    height: 180,
                    child: Row(
                      children: [
                        ImageContainer(image: images[0]),
                        const SizedBox(
                          width: 6,
                        ),
                        ImageContainer(image: images[1]),
                        const SizedBox(
                          width: 6,
                        ),
                        ImageContainer(image: images[2]),
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
                                ImageContainer(image: images[0]),
                                const SizedBox(width: 6),
                                ImageContainer(image: images[1]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            height: 150,
                            child: Row(
                              children: [
                                ImageContainer(image: images[2]),
                                const SizedBox(width: 6),
                                ImageContainer(image: images[3]),
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
                                    ImageContainer(image: images[0]),
                                    const SizedBox(width: 6),
                                    ImageContainer(image: images[1]),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 150,
                                child: Row(
                                  children: [
                                    ImageContainer(image: images[2]),
                                    const SizedBox(width: 6),
                                    ImageContainer(image: images[3]),
                                    const SizedBox(width: 6),
                                    ImageContainer(image: images[4]),
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
                                        ImageContainer(image: images[0]),
                                        const SizedBox(width: 6),
                                        ImageContainer(image: images[1]),
                                        const SizedBox(width: 6),
                                        ImageContainer(image: images[2]),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                    height: 150,
                                    child: Row(
                                      children: [
                                        ImageContainer(image: images[3]),
                                        const SizedBox(width: 6),
                                        ImageContainer(image: images[4]),
                                        const SizedBox(width: 6),
                                        ImageContainer(image: images[5]),
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
                                            ImageContainer(image: images[0]),
                                            const SizedBox(width: 6),
                                            ImageContainer(image: images[1]),
                                            const SizedBox(width: 6),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      SizedBox(
                                        height: 150,
                                        child: Row(
                                          children: [
                                            ImageContainer(image: images[2]),
                                            const SizedBox(width: 6),
                                            ImageContainer(image: images[3]),
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
                                            ImageContainer(image: images[4]),
                                            const SizedBox(width: 6),
                                            ImageContainer(image: images[5]),
                                            const SizedBox(width: 6),
                                            ImageContainer(image: images[6]),
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
                                                ImageContainer(image: images[0]),
                                                const SizedBox(width: 6),
                                                ImageContainer(image: images[1]),
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
                                                ImageContainer(image: images[2]),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                ImageContainer(image: images[3]),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                ImageContainer(image: images[4]),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          SizedBox(
                                            height: 150,
                                            child: Row(
                                              children: [
                                                ImageContainer(image: images[5]),
                                                const SizedBox(width: 6),
                                                ImageContainer(image: images[6]),
                                                const SizedBox(width: 6),
                                                ImageContainer(image: images[7]),
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
                                                    ImageContainer(image: images[0]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(image: images[1]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(image: images[2]),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              SizedBox(
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    ImageContainer(image: images[3]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(image: images[4]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(image: images[5]),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              SizedBox(
                                                height: 150,
                                                child: Row(
                                                  children: [
                                                    ImageContainer(image: images[6]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(image: images[7]),
                                                    const SizedBox(width: 6),
                                                    ImageContainer(image: images[8]),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox();
  }
}

class ImageContainer extends StatelessWidget {
  final ImageProvider image;
  final void Function(ImageProvider image)? removeImageCallback;

  const ImageContainer({
    required this.image,
    this.removeImageCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: removeImageCallback != null ? () => removeImageCallback!(image) : () {},
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
              image: image,
            ),
          ),
        ),
      ),
    );
  }
}
