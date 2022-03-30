import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assignment4",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,

      ),
      home: HomePage(title: "ImageViewApp",) ,
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  void pressButton () {
    setState(() {
      isPressed = true;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: pressButton, child: Text("ADD IMAGE")),
            isPressed ? const Image(
              image: NetworkImage('https://wikiimg.tojsiabtv.com/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/440px-Pierre-Person.jpg'),
              height:180,

            ) : Container(),
           
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            }, child: Text("OPEN NEXT PAGE")),
            
            Container(child: MyListView(),
              height: 140,

            )


          ],
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['Ali', 'Burak', 'Ceren','Onur','Oktay'];
    final List<int> colorCodes = <int>[600, 500, 100, 400, 700];

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 20,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('${entries[index]}')),
          );
        }
    );
  }
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {'Settings', 'About', 'Exit'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}