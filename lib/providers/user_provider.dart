import 'package:flutter/material.dart';
import 'package:happy2help/models/user_model.dart';

// UserProvider class extends ChangeNotifier to provide user data to other widgets and notify them of changes.
class UserProvider extends ChangeNotifier {
  // The _user variable holds the current user data.
  UserModel _user = UserModel(
    id: '',
    email: '',
    name: '',
    token: '',
    password: '',
  );

  // Getter for accessing the current user data.
  UserModel get user => _user;

  // setUser function updates the user data from a JSON string.
  void setUser(String? user) {
    if (user != null && user.isNotEmpty) {
      _user = UserModel.fromJson(user); // Convert JSON string to UserModel object.
      notifyListeners(); // Notify listeners of the change in user data.
    }
  }

  // setUserFromModel function updates the user data directly from a UserModel object.
  void setUserFromModel(UserModel user) {
    _user = user; // Update user data directly from the provided UserModel object.
    notifyListeners(); // Notify listeners of the change in user data.
  }
}
