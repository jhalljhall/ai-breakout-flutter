part of breakout_models;

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutPrompt {
  Map<String, dynamic> data = {};
  BreakoutPrompt();

  factory BreakoutPrompt.fromJson(Map<String, dynamic> json) =>
      _$BreakoutPromptFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutPromptToJson(this);

  @override
  String toString() => "'prompt': { 'data': $data }";
}
