part of breakout_models;

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutSession {
  String data = "";
  late int sessionId;
  late String sessionCode;
  late String title;

  late BreakoutStory bs;

  BreakoutSession();

  factory BreakoutSession.fromJson(Map<String, dynamic> json) =>
      _$BreakoutSessionFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutSessionToJson(this);

  @override
  String toString() => "'session': { 'id': $sessionId, 'code': $sessionCode }";
}
