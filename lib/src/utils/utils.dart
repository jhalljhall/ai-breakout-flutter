library breakout_utils;

import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:cron/cron.dart' as cron;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

part '../../src/utils/settings.dart';
part '../../src/utils/constants.dart';

/// A simple method for printing warning messages to the console.
void info(String message) =>
    (Settings().debugLevel.index >= DebugLevel.INFO.index)
        ? print('[mIme INFO] $message')
        : 0;

/// A simple method for printing warning messages to the console.
void warning(String message) =>
    (Settings().debugLevel.index >= DebugLevel.WARNING.index)
        ? print('[mIme WARNING]  $message')
        : 0;

/// A simple method for printing debug messages to the console.
void debug(String message) =>
    (Settings().debugLevel.index >= DebugLevel.DEBUG.index)
        ? print('[DEBUG] $message')
        : 0;


class NoAsset extends StatelessWidget {
  const NoAsset(BuildContext context, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UuidJsonConverter extends JsonConverter<String, String> {
  @override
  fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  toJson(object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
// TODO
}

abstract class FailureException extends Equatable implements Exception {
  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType Exception';
}

/// Represents some additional [Color]s to be used
/// across the application
class Palette {
  static const background = Color(0xff202030);
  static const background700 = Color(0xff303040);
  static const accent = Colors.black12;
}

class ColorUtils {
  static int _hash(String value) {
    int hash = 0;
    for (var code in value.runes) {
      hash = code + ((hash << 5) - hash);
    }
    return hash;
  }

  static Color stringToColor(String value) {
    return Color(stringToHexInt(value));
  }

  static String stringToHexColor(String value) {
    String c = (_hash(value) & 0x00FFFFFF).toRadixString(16).toUpperCase();
    return "0xFF00000".substring(0, 10 - c.length) + c;
  }

  static int stringToHexInt(String value) {
    String c = (_hash(value) & 0x00FFFFFF).toRadixString(16).toUpperCase();
    String hex = "FF00000".substring(0, 8 - c.length) + c;
    return int.parse(hex, radix: 16);
  }

  ColorUtils._(); // private constructor
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}