import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoListTile extends StatelessWidget {
  final String destination;
  final String continent;
  final double price;

  const InfoListTile({
    required this.destination,
    required this.continent,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.maxFinite,
      height: 104,
      decoration: BoxDecoration(
        // TODO: use gradient color LinearGradient?
        color: const Color(0xff132c40),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 3),
            spreadRadius: 2,
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 18, bottom: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/location_icon.svg",
                      width: 20,
                      height: 20,
                      color: const Color(0xffCAC8C8),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      continent,
                      style: const TextStyle(
                        color: Color(0xffCAC8C8),
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 16, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(
                    color: Color(0xffCAC8C8),
                    fontSize: 14,
                  ),
                ),
                Text(
                  "\$${price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Color(0xffCAC8C8),
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
