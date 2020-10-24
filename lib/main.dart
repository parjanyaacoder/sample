import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isEditable = false;
  String displayText = 'Game in early childhood is the best foundation for success in school. Our activities will challenge and develop your child\'s creativity.';
  TextEditingController text = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    text.text = displayText;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            height: 300,
            child: SafeArea(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 30,),
                      Text('My Profile',style: TextStyle(color: Colors.white),),

                      Container(height:50,child:
                      ClipPolygon(child:
                      Image(image:AssetImage("photo.jpeg")),
                          sides: 8,
                        borderRadius: 5.0,


                      )),
                      SizedBox(height: 10,),
                      Text('Scott Ravi',style: TextStyle(color: Colors.white),),
                      Text('LMS ID: ABC123',style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10,),
                      Container(

                          width:300,child: isEditable ? TextField(onEditingComplete:(){ displayText = text.text;},
                      controller: text,
                      ):Text(displayText,style: TextStyle(color: Colors.white,wordSpacing: 2, ),textAlign: TextAlign.center,)),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        child: RaisedButton(onPressed: (){
                          displayText = text.text;
                          setState(() {
                            isEditable = !isEditable;
                          });
                        },
                          color: Colors.white,
                        child: Text(isEditable ? 'SAVE' :'EDIT',style: TextStyle(color: Colors.blue),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Container(

                         decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(5),),
                         child: Row(
                           children: [
                             FlatButton(onPressed: (){}, child: Text(
                               'Personal information',style: TextStyle(color: Colors.blue),
                             )),
                             FlatButton(onPressed: (){}, child: Text(
                                 'Events'
                             )),
                             FlatButton(onPressed: (){}, child: Text(
                                 'Academic'
                             )),
                             FlatButton(onPressed: (){}, child: Text(
                                 'Placement'
                             )),

                           ],
                         ),
                       ),
                     ),
                   ),
                    Text('Full name',style: TextStyle(color: Colors.grey),),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFFDBEDFF),borderRadius: BorderRadius.circular(5.0),border: Border.all(color: Colors.grey),),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Jane Doe'),
                      )
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone No',style: TextStyle(color: Colors.grey),),
                            Container(
                                width: 150,
                                decoration: BoxDecoration(color: Color(0xFFDBEDFF),borderRadius: BorderRadius.circular(5.0),border: Border.all(color: Colors.grey),),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('8347XXX56'),
                                )
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Group',style: TextStyle(color: Colors.grey),),
                            Container(
                              width: 150,
                                decoration: BoxDecoration(color: Color(0xFFDBEDFF),borderRadius: BorderRadius.circular(5.0),border: Border.all(color: Colors.grey),),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('B+'),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address',style: TextStyle(color: Colors.grey),),
                        Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(color: Color(0xFFDBEDFF),borderRadius: BorderRadius.circular(5.0),border: Border.all(color: Colors.grey),),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('ICRISAT Main Entrance Gate, Patancheru, Ramachandra Puram, Hyderabad, Telangana 502324',),
                            )
                        ),
                      ],
                    ),
                   Center(
                     child: FlatButton(onPressed: (){},
                         child:Text('SAVE',style: TextStyle(color: Colors.white),),
                     color: Colors.blue,),
                   )

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
