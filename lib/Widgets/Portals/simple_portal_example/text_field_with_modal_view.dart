import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/services/string_service.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/text_field_with_modal_view_modal.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/widgets/animated_portal_target.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/widgets/requirements_popup.dart';
import 'package:stacked/stacked.dart';

class TextFieldWithModalView extends StatelessWidget {
  TextFieldWithModalView({super.key});

  // required to validate the form before submission
  final formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => TextFieldWithModalViewModel(),
        onViewModelReady: (model) {
          // add listener to TextEditingController
          // when TextEditingController state changes in any way
          // perform some callback action
          userNameController.addListener(
            () => debugPrint(userNameController.text),
          );
          passwordFocus.addListener(
            () => model.setShowRequirements(passwordFocus.hasFocus),
          );
        },
        builder: (context, model, _) => Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: userNameController,
                          focusNode: userNameFocus,
                          autofillHints: const [AutofillHints.username],
                          textCapitalization: TextCapitalization.words,
                          onChanged: model.setUserName,
                          onEditingComplete: () => passwordFocus.requestFocus(),
                          validator: stringService.customStringValidator(
                            // pass controller instead of value from validator has the safe affect
                            userNameController.text,
                            configuration: const StringValidatorConfiguration(notEmpty: true),
                          ),
                          decoration: const InputDecoration(
                            label: Text("Username"),
                            hintText: "Enter Username",
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AnimatedPortalTarget(
                          visible: model.showRequirements,
                          // triggered when user taps outside of the follower
                          onPressed: () {
                            model.setShowRequirements(false);
                            unFocusAll(context);
                          },
                          anchor: const Aligned(
                            follower: Alignment.bottomRight,
                            target: Alignment.topRight,
                          ),
                          follower: RequirementsPopup(
                            passwordController: passwordController,
                          ),
                          target: TextFormField(
                            obscureText: model.obscurePassword,
                            textInputAction: TextInputAction.done,
                            controller: passwordController,
                            focusNode: passwordFocus,
                            autofillHints: const [AutofillHints.password],
                            onChanged: model.setPassword,
                            onEditingComplete: () => passwordFocus.unfocus(),
                            validator: stringService.passwordIsValid,
                            decoration: InputDecoration(
                              label: const Text("Password"),
                              hintText: "Enter Password",
                              suffixIcon: IconButton(
                                onPressed: () => model.setObscurePassword(!model.obscurePassword),
                                icon: Icon(model.obscurePassword ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState!.validate()
                          ? () {
                              unFocusAll(context);
                              userNameController.clear();
                              passwordController.clear();
                            }()
                          : showSnackBar(context, "log in failed, please try again");
                    },
                    child: const Text("Log In"),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

// remove the focus from all currently focused nodes
void unFocusAll(BuildContext context) => FocusScope.of(context).requestFocus(FocusNode());

void showSnackBar(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );


// object.addListener

//   - when a mutable object changes execute some callback associated to the object
