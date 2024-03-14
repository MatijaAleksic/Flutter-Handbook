import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Bloc/user_list/user_list_bloc.dart';

import 'Bloc/user.dart';
import 'card/quote_card.dart';
import 'model/quote.dart';

void main() => runApp(MaterialApp(home: QuoteListObjectCardsSeparateClass()));

// class BlocPatternExample extends StatelessWidget {
//   const BlocPatternExample({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => UserListBloc()), // Provide your UserListBloc instance
//       ],
//       child: MaterialApp(
//         home: MyHomePage(),
//       ),
//     );
//   }
// }
//
// Widget buildUserTitle(BuildContext, User user){
//   return ListTitle(
//     title: Text(user.name),
//     subtitle: Text(user.email),
//   )
// }
// class MyHomePage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Title of the app"),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: BlocBuilder<UserListBloc, UserListState>(
//         builder: (context, state) {
//           if(state is UserListUpdated && state.users.isNotEmpty){
//             final users = state.users;
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index){
//                 final user = users[index];
//                 return buildUserTitle(context, user);
//               }
//             )
//           }
//           else const SizedBox(
//             width: double.infinity,
//             child: Center(child: Text('No users found')),
//           );
//         },
//       );
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Perform any action here
//           print("Button pressed");
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }



//STATELESS WIDGETS (Nemaju stanja ne cuvaju podatke o stanju vec uvjek postoje onakve kakve su)
class Home extends StatelessWidget {
  // const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of the app",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.black,
                fontFamily: 'Montserrat-VariableFont')),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
          ///////////
          //IMAGES //
          ///////////

          //ONE WAY
          // child: Image(
          //   // image: NetworkImage('https://img.freepik.com/free-vector/bokeh-defocused-background_23-2148497833.jpg'),
          //   image: AssetImage('assets/image.jpg'),
          //   fit: BoxFit.fill,
          // )

          //OTHER WAY
          // child: Image.asset('assets/image.jpg')
          // child: Image.network('https://img.freepik.com/free-vector/bokeh-defocused-background_23-2148497833.jpg')

          /////////////
          // BUTTONS //
          /////////////
          child: ElevatedButton.icon(
            onPressed: () {
              print("mail button clicked!");
            },
            icon: Icon(Icons.mail),
            label: Text("mail me!"),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Button pressed");
        },
        // child: Text("Click me!"),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Padding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of the app",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.black,
                fontFamily: 'Montserrat-VariableFont')),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(90),
        child: Text("Padded text")
      )
    );
  }
}

class Rows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text("Hello world!"),
            ElevatedButton(
                onPressed: null,
                child: Text("Click me!")
            ),
            Container(
              color: Colors.cyan,
              padding: EdgeInsets.all(30),
              child: Text("inside container"),
            )
          ]
        )
    );
  }
}

class Columns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [
              Row(
                children: <Widget>[
                  Text("Hello"),
                  Text("hello2")
                ]
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.cyan,
                child: Text('one')
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.pinkAccent,
                  child: Text('two')
              ),
              Container(
                  padding: EdgeInsets.all(40),
                  color: Colors.amber,
                  child: Text('three')
              )
            ]
        )
    );
  }
}

class ExpandedFlex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(child: Image.asset('assets/image.jpg')),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}


//STATEFULL WIDGETS
class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
            'Ninja ID Card',
            style: TextStyle(
              color: Colors.white
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() { //ovo postavlja stanje i rerender cjelog izgleda
            ninjaLevel += 1;
          });
        },
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/image.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Chun-Li',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'HOMETOWN',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Beijing, China',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'chun.li@thenetninja.co.uk',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



//STATEFULL VIEW OF LIST OF STRINGS
class QuoteListStrings extends StatefulWidget {
  @override
  _QuoteListStringsState createState() => _QuoteListStringsState();
}

class _QuoteListStringsState extends State<QuoteListStrings> {

  List<String> quotes = [
    'Be yourself; everyone else is already taken',
    'I have nothing to declare except my genius',
    'The truth is rarely pure and never simple'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Column(
            children: quotes.map((quote) => Text(quote)).toList(),
          ),
        ),
      ),
    );
  }
}

//STATEFULL VIEW OF LIST OF OBJECTS
class QuoteListObjects extends StatefulWidget {
  @override
  _QuoteListObjectsState createState() => _QuoteListObjectsState();
}

class _QuoteListObjectsState extends State<QuoteListObjects> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Column(
            children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(),
          ),
        ),
      ),
    );
  }
}


//CARDS VIEW FROM QUOTES
class QuoteListObjectCards extends StatefulWidget {
  @override
  _QuoteListObjectCardsState createState() => _QuoteListObjectCardsState();
}

class _QuoteListObjectCardsState extends State<QuoteListObjectCards> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple')
  ];

  Widget quoteTemplate(quote) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                quote.author,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}


//CARDS VIEW AS SEPARATE CLASS
class QuoteListObjectCardsSeparateClass extends StatefulWidget {
  @override
  _QuoteListObjectCardsSeparateClassState createState() => _QuoteListObjectCardsSeparateClassState();
}

class _QuoteListObjectCardsSeparateClassState extends State<QuoteListObjectCardsSeparateClass> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete : () {
              setState( () {
                quotes.remove(quote);
              });
            }
        )).toList(),
      ),
    );
  }
}

