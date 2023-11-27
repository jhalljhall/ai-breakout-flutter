part of breakout_blocs;

class BreakoutBloc extends Bloc<BreakoutEvent, BreakoutState> {
  DeploymentMode deploymentMode = DeploymentMode.LIVE;

  final BreakoutRepo repository;

  late BreakoutStory b;

  BreakoutBloc({required this.repository}) : super(
      BreakoutInitState(
        status: BreakoutStatus.initial,
      )
  ) {
    on<BreakoutSetInitialStateEvent>(_breakoutInitial);
  }

  /// Initialize the BLoC.
  Future<void> initialize({ DeploymentMode deploymentMode = DeploymentMode.LIVE }) async {
    await Settings().init();
    Settings().debugLevel = DebugLevel.DEBUG;
    this.deploymentMode = deploymentMode;

    b = BreakoutStory();

    info('$runtimeType initialized');
  }

  void resume() async {
    //

    info("resume");
  }

  void pause() {
    //

    info("pause");
  }

  void stop() async {
    //

    info("stop");
  }

  void _breakoutInitial(BreakoutSetInitialStateEvent event, Emitter<BreakoutState> emit) async {

    try {
      resume();
      BreakoutInitState newState = BreakoutInitState(
          status: BreakoutStatus.initial
      );

      emit(newState);
    } on FailureException catch (e) {
      print('$e.runtimeType.toString() $e.message');
    }
  }
}
