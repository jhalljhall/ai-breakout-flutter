part of breakout_views;

class BreakoutChatView extends StatelessWidget {

  const BreakoutChatView(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Padding(
        padding: EdgeInsets.only(top:24.0),
        child: Text("Chat View")
    );
  }
}