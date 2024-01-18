import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
  }
class SplashScreenState extends State<SplashScreen> {
static const String KEYLOGIN = 'Login';
  @override
  void initState() {
    super.initState();
    whereToGo();

    }
  void whereToGo() async {
    var sharedpref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedpref.getBool(SplashScreenState.KEYLOGIN);

 Timer(
   Duration(seconds: 3),(){
     if(isLoggedIn != null){
       if(isLoggedIn){
         Navigator.pushReplacement(context,
             MaterialPageRoute(builder: (context) => MyHomePage(title: 'My Home',)),);
       } else {
         Navigator.pushReplacement(context,
             MaterialPageRoute(builder: (context) => LoginPage()),);
       }
     } else {
       Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) => LoginPage()),);
     }
 }
 );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text('Welcome to Flutter', style: TextStyle(
            fontWeight: FontWeight.w500,fontSize: 40,

          ),
          ),
        ),
      )
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

      ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => LoginPage()),);
    },
     tooltip: 'LogOut',
     child: Icon(Icons.exit_to_app),
     ),
    );
  }
}
