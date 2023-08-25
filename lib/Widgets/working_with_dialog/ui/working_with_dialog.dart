import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/working_with_dialog/ui/model/check_box_model.dart';
import 'package:provider/provider.dart';

class WorkingWithDialog extends StatelessWidget {
  const WorkingWithDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.purple,
        appBar: AppBar(
          title: const Text('Working With Dialog'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () async {
              await showDialog(
                context: context,
                barrierColor: const Color(0xFF012D7A).withOpacity(.60),
                builder: (context) {
                  // return SimpleDialog(
                  //   backgroundColor: ,
                  // );
                  return Container(
                    constraints: const BoxConstraints(minHeight: 160.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFF012D7A).withOpacity(.60),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 125),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "INTENDED USE STATEMENT",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF979797),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width / 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Expanded(
                                  child: ListView(
                                    children: [
                                      const Text(
                                        "Healthy lifestyle choices, including exercise, may help improve health outcomes associated with certain chronic diseases or conditions. The Digital Joint and Spine App is intended to provide condition specific information and general guidance to empower you to make better informed decisions about your own health and provide options to facilitate prevention and self-management of certain chronic conditions. The Digital Joint and Spine App is not intended as a tool for use in diagnosing or providing specific medical treatment related to a disease or chronic condition. Discuss specific medical questions or concerns with your treating physician before starting a new exercise regimen.",
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: "CircularXX",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Consumer(
                                            builder: (context, CheckBoxModel model, child) => SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: Checkbox(
                                                  fillColor: MaterialStateProperty.resolveWith(
                                                    (states) => const Color(0xFF242A3D),
                                                  ),
                                                  value: model.isChecked,
                                                  onChanged: (value) {
                                                    model.onChecked();
                                                  }),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "I acknowledge that I have read and understand the Intended Use Statement",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Consumer(
                                    builder: (context, CheckBoxModel model, child) => OutlinedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.resolveWith(
                                            (states) => model.isChecked ? const Color(0xFF0052B1) : const Color(0xFFEBECE1),
                                          ),
                                          side: MaterialStateProperty.resolveWith(
                                            (states) => BorderSide.none,
                                          )),
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: model.isChecked ? Colors.white : const Color(0xFF242424),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
