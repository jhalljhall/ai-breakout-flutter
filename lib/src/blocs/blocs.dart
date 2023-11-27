// ignore_for_file: depend_on_referenced_packages

library breakout_blocs;

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '/src/models/models.dart';
import '/src/utils/utils.dart';
import '/src/repositories/repositories.dart';

part 'breakout_bloc.dart';
part 'breakout_events.dart';
part 'breakout_state.dart';

part 'blocs.g.dart';