part of breakout_blocs;

/// Event being processed by [MimeBloc].
@immutable
abstract class BreakoutEvent extends Equatable {
  const BreakoutEvent();
}

class BreakoutSetInitialStateEvent extends BreakoutEvent {
  const BreakoutSetInitialStateEvent();
  @override
  List<Object> get props => [];
}

class SelectBreakoutByIdEvent extends BreakoutEvent {
  const SelectBreakoutByIdEvent({
    required this.id
  });
  final int id;

  @override
  List<Object?> get props => [id];
}