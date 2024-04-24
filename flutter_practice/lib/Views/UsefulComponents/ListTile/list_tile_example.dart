import 'package:flutter/material.dart';

class ListTileExampleMain extends StatefulWidget {
  const ListTileExampleMain({super.key});

  @override
  State<ListTileExampleMain> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExampleMain> with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  bool _selected = false;
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Samples')),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Hero(
              tag: 'ListTile-Hero',
              child: Material(
                child: ListTile(
                  title: const Text('ListTile with Hero'),
                  subtitle: const Text('Tap here for Hero transition'),
                  tileColor: Colors.cyan,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: const Text('ListTile Hero')),
                          body: Center(
                            child: Hero(
                              tag: 'ListTile-Hero',
                              child: Material(
                                child: ListTile(
                                  title: const Text('ListTile with Hero'),
                                  subtitle: const Text('Tap here to go back'),
                                  tileColor: Colors.blue[700],
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Material(
                child: ListTile(
                  title: Text('ListTile with FadeTransition'),
                  selectedTileColor: Colors.green,
                  selectedColor: Colors.white,
                  selected: true,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: SizeTransition(
                  sizeFactor: _sizeAnimation,
                  axisAlignment: -1.0,
                  // Wrap the ListTile in a Material widget so the ListTile has someplace
                  // to draw the animated colors during the size transition.
                  child: const Material(
                    child: ListTile(
                      title: Text('ListTile with SizeTransition'),
                      tileColor: Colors.red,
                      minVerticalPadding: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: CircleAvatar(child: Text('B')),
              title: Text('Headline'),
              subtitle: Text(
                  'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
              trailing: Icon(Icons.favorite_rounded),
            ),
            const Divider(height: 0),
            const ListTile(
              leading: CircleAvatar(child: Text('C')),
              title: Text('Headline'),
              subtitle: Text(
                  "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
              trailing: Icon(Icons.favorite_rounded),
              isThreeLine: true,
            ),
            const Divider(height: 0),
            ListTile(
              enabled: _enabled,
              selected: _selected,
              onTap: () {
                setState(() {
                  // This is called when the user toggles the switch.
                  _selected = !_selected;
                });
              },
              // This sets text color and icon color to red when list tile is disabled and
              // green when list tile is selected, otherwise sets it to black.
              iconColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.red;
                }
                if (states.contains(MaterialState.selected)) {
                  return Colors.green;
                }
                return Colors.black;
              }),
              // This sets text color and icon color to red when list tile is disabled and
              // green when list tile is selected, otherwise sets it to black.
              textColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.red;
                }
                if (states.contains(MaterialState.selected)) {
                  return Colors.green;
                }
                return Colors.black;
              }),
              leading: const Icon(Icons.person),
              title: const Text('Headline'),
              subtitle: Text('Enabled: $_enabled, Selected: $_selected'),
              trailing: Switch(
                onChanged: (bool? value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    _enabled = value!;
                  });
                },
                value: _enabled,
              ),
            ),
            CustomListItemTwo(
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.pink),
              ),
              title: 'Flutter 1.0 Launch',
              subtitle: 'Flutter continues to improve and expand its horizons. '
                  'This text should max out at two lines and clip',
              author: 'Dash',
              publishDate: 'Dec 28',
              readDuration: '5 mins',
            ),
            CustomListItemTwo(
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
              title: 'Flutter 1.2 Release - Continual updates to the framework',
              subtitle: 'Flutter once again improves and makes updates.',
              author: 'Flutter',
              publishDate: 'Feb 26',
              readDuration: '12 mins',
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Expanded(
          child: Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          author,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black87,
          ),
        ),
        Text(
          '$publishDate - $readDuration',
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
