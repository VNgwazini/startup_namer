import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //text in top bar of app
      title: 'Startup Name Generator',
      //content under the title in the main area
      home: RandomWords(),
    );
  }
}
//structure, displays a stateful widget
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}
//content that populate structure, aka our stateful widget's state
class _RandomWordsState extends State<RandomWords> {
  //leading _ means this variable is private to class
  //saves suggestions word parings
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

//builds listview that displays suggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //callback called once per suggested word pairing and places each suggestion into a listTile row;
        itemBuilder: (context, i) {
          if(i.isOdd) return const Divider();

          //we divide by do to determine how many pairs we have
          final index = i ~/ 2;
          //if we reach the end of out pairings list
          if(index >= _suggestions.length){
            //make 10 more
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  //builds each row element which is a tile with text on it
  Widget _buildRow(WordPair pair){
    //create a tile item
    return ListTile(
      title: Text(
        //what the tile says
        pair.asPascalCase,
        //the text stye is, similar to style={{CSS}} in react
        style: _biggerFont,
      ),
    );
  }
}

