part of breakout_pages;

class BreakoutPage extends StatelessWidget {

  late Widget child = const BreakoutLoaderWidget(text:"breakout page");

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
            width: s.width,
            height: s.height,
            child: BlocProvider(
                create: (BuildContext context) => BreakoutBloc(repository: context.read<BreakoutRepo>()),
                child: BreakoutChatView(context)
            )
        )
    );
  }
}
//


