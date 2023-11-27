// ignore_for_file: constant_identifier_names

part of breakout_models;

/// Represents a MIme token.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutStory {
  late String data;
  late String title;
  late String type;
  late int id;
  late List<BreakoutPrompt> prompts;

  // objectives, achievements,

  BreakoutStatus status = BreakoutStatus.INITIALIZED;

  @JsonKey(name: 'breakout')
  late BreakoutSession breakoutSession;

  BreakoutStory();

  factory BreakoutStory.fromJson(Map<String, dynamic> json) => _$BreakoutStoryFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutStoryToJson(this);

  @override
  String toString() => "'story': { 'data': $data }";

  BreakoutSession get book {
    return breakoutSession;
  }

  void addPrompt (BreakoutPrompt p){
    prompts.add(p);
  }

  List<BreakoutPrompt> getPrompts (){
    return prompts;
  }
}

enum BreakoutStatus {
  INSTANTIATED,
  INITIALIZED,
  LOADING,
  RUNNING,
  PAUSED,
  COMPLETED,
  PLAYED,
  DISPOSED
}



