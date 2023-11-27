// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreakoutSession _$BreakoutSessionFromJson(Map<String, dynamic> json) =>
    BreakoutSession()
      ..data = json['data'] as String
      ..sessionId = json['session_id'] as int
      ..sessionCode = json['session_code'] as String
      ..title = json['title'] as String;

Map<String, dynamic> _$BreakoutSessionToJson(BreakoutSession instance) =>
    <String, dynamic>{
      'data': instance.data,
      'session_id': instance.sessionId,
      'session_code': instance.sessionCode,
      'title': instance.title,
    };

BreakoutUser _$BreakoutUserFromJson(Map<String, dynamic> json) => BreakoutUser()
  ..id = json['id'] as int?
  ..isActivated = json['is_activated'] as bool?
  ..email = json['email'] as String?
  ..roles = (json['roles'] as List<dynamic>).map((e) => e as String).toList()
  ..token = json['token'] == null
      ? null
      : BreakoutToken.fromJson(json['token'] as Map<String, dynamic>);

Map<String, dynamic> _$BreakoutUserToJson(BreakoutUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('is_activated', instance.isActivated);
  writeNotNull('email', instance.email);
  val['roles'] = instance.roles;
  writeNotNull('token', instance.token);
  return val;
}

BreakoutToken _$BreakoutTokenFromJson(Map<String, dynamic> json) =>
    BreakoutToken(
      data: json['data'] as String,
    );

Map<String, dynamic> _$BreakoutTokenToJson(BreakoutToken instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BreakoutStory _$BreakoutStoryFromJson(Map<String, dynamic> json) =>
    BreakoutStory()
      ..data = json['data'] as String
      ..title = json['title'] as String
      ..type = json['type'] as String
      ..id = json['id'] as int
      ..prompts = (json['prompts'] as List<dynamic>)
          .map((e) => BreakoutPrompt.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = $enumDecode(_$BreakoutStatusEnumMap, json['status'])
      ..breakoutSession =
          BreakoutSession.fromJson(json['breakout'] as Map<String, dynamic>);

Map<String, dynamic> _$BreakoutStoryToJson(BreakoutStory instance) =>
    <String, dynamic>{
      'data': instance.data,
      'title': instance.title,
      'type': instance.type,
      'id': instance.id,
      'prompts': instance.prompts,
      'status': _$BreakoutStatusEnumMap[instance.status]!,
      'breakout': instance.breakoutSession,
    };

const _$BreakoutStatusEnumMap = {
  BreakoutStatus.INSTANTIATED: 'INSTANTIATED',
  BreakoutStatus.INITIALIZED: 'INITIALIZED',
  BreakoutStatus.LOADING: 'LOADING',
  BreakoutStatus.RUNNING: 'RUNNING',
  BreakoutStatus.PAUSED: 'PAUSED',
  BreakoutStatus.COMPLETED: 'COMPLETED',
  BreakoutStatus.PLAYED: 'PLAYED',
  BreakoutStatus.DISPOSED: 'DISPOSED',
};

BreakoutPrompt _$BreakoutPromptFromJson(Map<String, dynamic> json) =>
    BreakoutPrompt()..data = json['data'] as Map<String, dynamic>;

Map<String, dynamic> _$BreakoutPromptToJson(BreakoutPrompt instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
