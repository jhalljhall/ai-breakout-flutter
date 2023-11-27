part of breakout_widgets;

class BreakoutLoaderWidget extends StatelessWidget{
  final String text;
  final bool showHideLoader;
  const BreakoutLoaderWidget({Key? key, required this.text, this.showHideLoader = false}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: showHideLoader ? const CircularProgressIndicator() : Container(),
            ),
            showHideLoader ? Text(text) : Container(),
          ],
        )
    );
  }
}