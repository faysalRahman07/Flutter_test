import 'package:flutter/material.dart' show AppBar, BoxDecoration, BuildContext, Color, Colors, Column, Drawer, DrawerHeader, EdgeInsets, Expanded, FloatingActionButton, Icon, IconButton, IconData, Icons, Key, ListTile, ListView, MaterialApp, Navigator, Row, Scaffold, Slider, State, StatefulWidget, StatelessWidget, Text, ThemeData, Widget, runApp;
import 'package:mdi/mdi.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
 

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return new IconButton(
      // Use the MdiIcons class for the IconData
      icon: new Icon(MdiIcons.sword),
      onPressed: () { print('Using the sword'); }
     );
  }
}


double sizeValue=125;
int x=0,y=0,z=0;

class Page {
  final String title;
  final IconData iconData;
  Page(this.title, this.iconData);
}

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer and Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   

  final List<Page> _pages = [
    Page('Home', Icons.home),
    Page('Feedback', Icons.feedback),
    Page('Profile', Icons.person_outline),
  ];

  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  double sliderAmount=0;
  double sliderAmount2=0;
  double sliderAmount3=0;

  void _openPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

   
    List<Widget> drawerItemWidgets = widget._pages
        .asMap()
        .map((int index, Page page) => MapEntry<int, Widget>(
            index,
            ListTile(
              title: Text(page.title),
              leading: Icon(page.iconData),
              selected: _currentPageIndex == index,
              onTap: () {
                _openPage(index);
                Navigator.pop(context);
              },
            )))
        .values
        .toList();
    drawerItemWidgets.insert(
      0,
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("My Icon"),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              // do something
              if(sizeValue>50)
              setState(() {sizeValue = sizeValue - 25;  });
              
            },
          ),
          IconButton(
            icon: Icon(MdiIcons.fromString('alpha-s-circle-outline')),
            onPressed: () {
                if (sizeValue>50){
              setState(() {sizeValue = 150;  });
              }
            },
          ),
          IconButton(
           icon: Icon(MdiIcons.fromString('alpha-m-circle-outline')),
            onPressed: () {
                if (sizeValue>50)
              setState(() {sizeValue = 175;  });
            },
          ),
          IconButton(
           icon: Icon(MdiIcons.fromString('alpha-l-circle-outline')),
            onPressed: () {
                if (sizeValue>50)
              setState(() {sizeValue = 250;  });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
                if (sizeValue<300){
              setState(() {sizeValue = sizeValue + 25;  });
              }
            },
          ),
        ],
      ),
      ///////////////////////////////////////
      body: Column(
        children: <Widget>[
          Expanded(
            
              child: Icon(
                Icons.alarm,
                color: Color.fromRGBO(x, y, z, 1),
                size: sizeValue,
              ),
            
          ),
        Row(
            children: [
                    Expanded(
                        flex:6,
                        child:Slider(
             value:sliderAmount,
             onChanged:(double delta){
                setState((){
                    sliderAmount=delta;
                    x=sliderAmount.toInt();
                });
             },
             min:0,
             max:255,
             divisions:255,
         ),
                    ),
        Expanded(
         flex: 1,
         child:FloatingActionButton.extended(
        label: Text(x.toString()),
        backgroundColor: Colors.pink,
      ),
    )
        
                    
        ],
         
        ),
        Row(
            children: [
                    Expanded(
                        flex:6,
                        child:Slider(
             value:sliderAmount2,
             onChanged:(double alpha){
                setState((){
                    sliderAmount2=alpha;
                    y=sliderAmount2.toInt();
                });
             },
             min:0,
             max:255,
             divisions:255,
         ),
                    ),
           Expanded(
         flex: 1,
         child:FloatingActionButton.extended(
        label: Text(y.toString()),
        backgroundColor: Colors.green,
      ),
    )
                    
        ],
         
        ),
        Row(
            children: [
                    Expanded(
                        flex:6,
                        child:Slider(
             value:sliderAmount3,
             onChanged:(double beta){
                setState((){
                    sliderAmount3=beta;
                    z=sliderAmount3.toInt();
                });
             },
             min:0,
             max:255,
             divisions:255,
         ),
                    ),
           Expanded(
         flex: 1,
         child:FloatingActionButton.extended(
        label: Text(z.toString()),
        backgroundColor: Colors.blue,
      ),
    )
                    
        ],
         
        ),





        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerItemWidgets,
        ),
      ),
    );
  }
}
