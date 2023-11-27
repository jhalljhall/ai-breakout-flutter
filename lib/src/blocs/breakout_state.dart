part of breakout_blocs;

enum BreakoutStatus { initial, success, error, loading, selected, paused, playing }

extension BreakoutStatusX on BreakoutStatus {
  bool get isInitial => this == BreakoutStatus.initial;
  bool get isSuccess => this == BreakoutStatus.success;
  bool get isError => this == BreakoutStatus.error;
  bool get isLoading => this == BreakoutStatus.loading;
  bool get isSelected => this == BreakoutStatus.selected;
  bool get isPaused => this == BreakoutStatus.paused;
  bool get isPlaying => this == BreakoutStatus.playing;
}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutState extends Equatable {
  /// {@macro mime_state}
  BreakoutState({
    BreakoutStatus status = BreakoutStatus.initial,
  });

  @override
  late BreakoutStatus status = BreakoutStatus.initial;

  @override
  List<Object> get props => [

  ];

  factory BreakoutState.fromJson(Map<String, dynamic> json) => _$BreakoutStateFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutStateToJson(this);

}

/// The initial state of the [BreakoutBloc].
@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutInitState extends BreakoutState {
  BreakoutInitState({
    BreakoutStatus status = BreakoutStatus.initial,
  });

  @override
  late BreakoutStatus status = BreakoutStatus.initial;


  @override
  List<Object> get props => [

  ];

  factory BreakoutInitState.fromJson(Map<String, dynamic> json) => _$BreakoutInitStateFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutInitStateToJson(this);
}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutLoadingState extends BreakoutState {
  BreakoutLoadingState({
    status
  });

  @override
  late BreakoutStatus status = BreakoutStatus.loading;

  @override
  List<Object> get props => [status];

  @override
  void notify (){
    print("BreakoutLoadingState");
  }
}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutSelectedState extends BreakoutState {
  BreakoutSelectedState({
    BreakoutStatus status = BreakoutStatus.initial,
  });

  @override
  late BreakoutStatus status;

  @override
  List<Object> get props => [

  ];

  factory BreakoutSelectedState.fromJson(Map<String, dynamic> json) => _$BreakoutSelectedStateFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutSelectedStateToJson(this);

}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutPlayingState extends BreakoutState {
  BreakoutPlayingState({
    BreakoutStatus status = BreakoutStatus.initial,

  });

  @override
  late BreakoutStatus status;

  @override
  List<Object> get props => [

  ];

  factory BreakoutPlayingState.fromJson(Map<String, dynamic> json) => _$BreakoutPlayingStateFromJson(json);

  Map<String, dynamic> toJson() => _$BreakoutPlayingStateToJson(this);

}

@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class BreakoutTogglePauseState extends BreakoutState {
  BreakoutTogglePauseState({
    BreakoutStatus status = BreakoutStatus.initial,
  });

  @override
  late BreakoutStatus status;

  @override
  List<Object> get props => [

  ];
}