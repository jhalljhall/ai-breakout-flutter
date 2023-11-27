part of breakout_views;

class BreakoutBookshelfReaderView extends StatelessWidget {

  BreakoutBookshelfReaderView(BuildContext context, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> books = [];

  Map<String, dynamic> book1 = {"title":"Basic Demo", "subtitle":"Move, Fade, Swipe, Chains"};
  Map<String, dynamic> book2 = {"title":"Advanced Demo", "subtitle":"Advanced and Combined animations"};
  Map<String, dynamic> book3 = {"title":"Text Demo", "subtitle":"Particle Effects, Story Driven"};
  Map<String, dynamic> book4 = {"title":"Rive Demo", "subtitle":"Moment-to-Moment"};
  Map<String, dynamic> book5 = {"title":"Particle Effects", "subtitle":"Fog, Mist, Smoke, Lightening"};
  Map<String, dynamic> book6 = {"title":"Batman", "subtitle":"The Batman"};
  Map<String, dynamic> book7 = {"title":"Batman", "subtitle":"In development"};
  Map<String, dynamic> book8 = {"title":"Solo Leveling", "subtitle":"In development"};

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    if(books.isEmpty) {
      books.add(book1);
      books.add(book2);
      books.add(book3);
      books.add(book4);
      books.add(book5);
      books.add(book6);
      books.add(book7);
      books.add(book8);
    }

    children = List.generate(books.length, (index) {
      int num = index + 1;
      return
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ListTile(
                title: Text(books[index]["title"]),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(books[index]["subtitle"]),
                ),
                trailing: const Icon(Icons.book_online_sharp, size: 56),
              ),
              TextButton(
                child: const Text('Breakout'),
                onPressed: () {
                  context.push('/breakout/$num');
                },
              ),
            ],
          ),
        );
    });

    return Padding(
        padding: const EdgeInsets.only(top:24.0),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: children
        )
    );
  }
}