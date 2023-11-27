part of breakout_models;

/// Represents a MIme token.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutToken {

  String data;

  BreakoutToken({
    required this.data,
  });

  factory BreakoutToken.fromJson(
      Map<String, dynamic> json) =>
      _$BreakoutTokenFromJson(json);
  Map<String, dynamic> toJson() => _$BreakoutTokenToJson(this);

  String toString() => "'token': { 'data': $data }";
}