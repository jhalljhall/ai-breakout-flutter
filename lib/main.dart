library breakout_app;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'src/auth/auth.dart';
import 'src/repositories/repositories.dart';
import 'src/services/services.dart';
import 'src/blocs/blocs.dart';
import 'src/utils/utils.dart';
import 'src/ui/shared/theme.dart';
import 'src/ui/pages/pages.dart';
import 'src/ui/views/views.dart';

import 'package:go_router/go_router.dart';

part 'src/app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");
  //print(dotenv.env['APP_NAME']);

  Bloc.observer = AppBlocObserver();
  await Upgrader.clearSavedSettings();

  runApp(App());
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    //print(transition);
  }
}

