part of breakout_repos;

abstract class AbstractBreakoutRepo {

}

class BreakoutRepo extends AbstractBreakoutRepo {

  late BreakoutStory currentBreakout;
  late List<BreakoutStory> breakouts;

  Future<BreakoutStory> loadBreakoutById(int id) async {
    // TODO: Load the breakout data by the id
    currentBreakout = BreakoutStory();
    //b = Breakout.fromJson();
    return currentBreakout;
  }

  Future<List<BreakoutStory>> getBreakouts() async {
    // TODO: get the breakout data
    //b = Breakout.fromJson();
    return breakouts;
  }
}