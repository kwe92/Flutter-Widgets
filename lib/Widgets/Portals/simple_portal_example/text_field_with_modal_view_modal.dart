import 'package:stacked/stacked.dart';

class TextFieldWithModalViewModel extends BaseViewModel {
  String? userName;
  String? password;
  bool obscurePassword = true;
  bool showRequirements = false;

  void setUserName(String text) {
    userName = text;
    notifyListeners();
  }

  void setPassword(String text) {
    password = text;
    notifyListeners();
  }

  void setObscurePassword(bool isObscured) {
    obscurePassword = isObscured;
    notifyListeners();
  }

  void setShowRequirements(bool showRequirements) {
    this.showRequirements = showRequirements;
    notifyListeners();
  }
}
