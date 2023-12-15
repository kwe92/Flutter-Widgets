import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/services/string_service.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/text_field_with_modal_view_modal.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/widgets/requirements_popup.dart';
import 'package:stacked/stacked.dart';

// TODO: review

class TextFieldWithModalView extends StatelessWidget {
  TextFieldWithModalView({super.key});

  // required to validate the form before submission
  final formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TextFieldWithModalViewModel(),
      onViewModelReady: (model) {
        // add listener to TextEditingController
        // when TextEditingController state changes in any way
        // perform some callback action
        userNameController.addListener(() {
          debugPrint(userNameController.text);
        });
        // add listener to FocusNode
        // when focus node state changes in any way
        // perform some callback action
        passwordFocus.addListener(() {
          model.setShowRequirements(passwordFocus.hasFocus);
        });
      },
      builder: (context, model, child) {
        return Scaffold(
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
                        onClose: () {
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
                    if (formKey.currentState!.validate()) {
                      // unfocuses all FocusNode's and activates any listeners attached to FocusNode's
                      unFocusAll(context);
                      userNameController.clear();
                      passwordController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "log in failed, please try again",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Log In"),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

class AnimatedPortalTarget extends StatelessWidget {
  final bool visible;
  final VoidCallback onClose;
  final Anchor anchor;
  final Widget target;
  final Widget follower;

  const AnimatedPortalTarget({
    required this.visible,
    required this.onClose,
    required this.anchor,
    required this.follower,
    required this.target,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Barrier(
        isVisible: visible,
        onPressed: onClose,
        target: PortalTarget(
          visible: visible,
          anchor: anchor,
          closeDuration: kThemeAnimationDuration,
          // animated follower widget
          portalFollower: TweenAnimationBuilder<double>(
            duration: kThemeAnimationDuration,
            curve: Curves.easeOut,
            tween: Tween(begin: 0, end: visible ? 1 : 0),
            builder: (context, progress, _) {
              return Transform(
                transform: Matrix4.translationValues(0, (1 - progress) * 50, 0),
                child: Opacity(
                  opacity: progress,
                  child: follower,
                ),
              );
            },
          ),
          // target widget
          child: target,
        ),
      );
}

/// Barrier: parent PortalTarget that wraps follower and target
/// to detect if the users clicked outside follower to close it (change the follower visibility)
class Barrier extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onPressed;
  final Widget target;

  const Barrier({
    required this.isVisible,
    required this.onPressed,
    required this.target,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PortalTarget(
        visible: isVisible,
        closeDuration: kThemeAnimationDuration,
        portalFollower: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          // ! required if you want a background for modal with animation
          // child: TweenAnimationBuilder(
          //   tween: ColorTween(
          //     begin: Colors.transparent,
          //     end: isVisible ? Colors.black54 : Colors.transparent,
          //   ),
          //   duration: kThemeAnimationDuration,
          //   builder: (context, color, _) {
          //     return ColoredBox(color: color!);
          //   },
          // ),
        ),
        // target widget
        child: target,
      );
}

// unFocusAll: remove the focus from all currently focused nodes
void unFocusAll(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

// object.addListener

//   - when a mutable object changes execute some callback associated to the object
