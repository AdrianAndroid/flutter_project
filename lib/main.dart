import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app.dart';
import 'package:flutter_project/repository/repository.dart';
import 'package:flutter_project/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
