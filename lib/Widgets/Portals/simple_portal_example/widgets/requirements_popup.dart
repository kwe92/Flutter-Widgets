import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/services/string_service.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/text_field_with_modal_view_modal.dart';
import 'package:stacked/stacked.dart';

class RequirementsPopup extends ViewModelWidget<TextFieldWithModalViewModel> {
  final TextEditingController passwordController;

  const RequirementsPopup({
    required this.passwordController,
    super.key,
  });

  @override
  Widget build(BuildContext context, TextFieldWithModalViewModel viewModel) {
    // do not show modal if password criteria satisfied
    final bool allFieldsSatisfied = () {
      final String? isValid = stringService.passwordIsValid(viewModel.password);

      return isValid != null && isValid.isNotEmpty ? false : true;
    }();

    return allFieldsSatisfied
        ? const SizedBox()
        : Container(
            width: MediaQuery.of(context).size.width / 1.25,
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.15),
                ),
              ],
            ),
            child: Column(
              children: [
                Requirement(
                  label: 'Password must contain a capital letter',
                  isSatisfied: stringService.containsUppercase(passwordController.text),
                ),
                Requirement(
                  label: 'Password must contain a lowercase letter',
                  isSatisfied: stringService.containsLowercase(passwordController.text),
                ),
                Requirement(
                  label: 'Password must contain a number',
                  isSatisfied: stringService.containsNumber(passwordController.text),
                ),
                Requirement(
                  label: 'Password must contain a special character',
                  isSatisfied: stringService.containsSpecialCharacter(passwordController.text),
                ),
                Requirement(
                  label: 'Password must contain at least 8 characters',
                  isSatisfied: stringService.contains8Characters(passwordController.text),
                ),
              ],
            ),
          );
  }
}

// Requirement: represents the criteria of a password requirement
class Requirement extends StatelessWidget {
  final String label;
  final bool isSatisfied;

  const Requirement({
    required this.label,
    required this.isSatisfied,
    super.key,
  });
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            isSatisfied ? Icons.check_box : Icons.warning_rounded,
            color: isSatisfied ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 6),
          // must be wrapped in flexible or Expanded widget
          // when ancestor is a PortalTarget or text will overflow
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isSatisfied ? Colors.black : Colors.red,
              ),
            ),
          )
        ],
      );
}
