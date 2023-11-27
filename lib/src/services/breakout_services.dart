part of breakout_services;

class BreakoutService {
  const BreakoutService();

  Future<http.Response> postBreakoutPrompt (BreakoutPrompt prompt) async {
    final response = await http
        .post(Uri.parse(
        Constants.API_URL + Constants.PROMPT_ROUTE),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: prompt.toString()
    );
    return response;
  }

  Future<http.Response> getBreakoutStories () async {
    final response = await http
        .get(Uri.parse(
        Constants.API_URL + Constants.GET_BREAKOUTS_ROUTE)
    );
    return response;
  }

  Future<http.Response> createBreakoutStorySession (BreakoutUser user, BreakoutSession story) async {
    final response = await http
        .post(Uri.parse(
        Constants.API_URL + Constants.CREATE_BREAKOUT_SESSION_ROUTE),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user': user.toString(),
          'story': story.toString()
        })
    );
    return response;
  }

  Future<http.Response> getBreakoutStorySession (int sessionId) async {
    final response = await http
        .get(Uri.parse(
        Constants.API_URL + Constants.CREATE_BREAKOUT_SESSION_ROUTE.replaceAll("{id}", sessionId.toString())),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    return response;
  }
}