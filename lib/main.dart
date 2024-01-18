import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bottom Navigation Bar'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    Text('Home', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
    Text('Search', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
    Text('Music', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
    Text('Person', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        showUnselectedLabels: false,
        //showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            myIndex = index;
          });

        },
        currentIndex: myIndex,
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
               label:'Home',
    backgroundColor: Colors.cyanAccent
    ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label:'Search',
              backgroundColor: Colors.deepOrange
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label:'Music',
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:'Person',
              backgroundColor: Colors.amberAccent
          ),
        ],

      )
    );
  }
}
