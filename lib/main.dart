import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home: MyApp()));


class Questions
{
  String ques;
  bool answ;
  Questions({String q,bool a})
  {
    ques=q;
    answ=a;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int counter=0;
  

  List<Widget> ico=[];
  
  List<Questions> q1=[
    Questions(q:'Question 1',a:true),
    Questions(q:'Question 2',a:false),
    Questions(q:'Question 3',a:true),
    Questions(q:'Question 4',a:true),
    Questions(q:'Game Over',a:true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('A Simple Game'),
        actions: <Widget>[
          IconButton( 
            icon: Icon(Icons.refresh),
            color:Colors.white,
            onPressed: (){
              setState(() {
                counter=0;
              ico.clear();  
              });
              
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
       Expanded 
       ( 
         flex: 6,
         child: Center(         

            child: counter==4 ? Text(q1[counter].ques,style: TextStyle(color:Colors.redAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.center,) : Text(q1[counter].ques,style: TextStyle(color:Colors.white),textAlign: TextAlign.center,),
          ),
      ),

                      
            Expanded(
             child:Padding   
            (  
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
             
             child:Card(
               color: Colors.lightGreen,
             child:RaisedButton( 

               
               hoverColor: Colors.greenAccent,
                onPressed:((){
                  if(counter==4)
                  {
                     // show the dialog  
                      showDialog(  
                        context: context,  
                        builder: (BuildContext context) {  
                          return  AlertDialog( 
                          title: Text('Simple Game'),
                          content: Text('Game Over restart to play again'),
                          actions: <Widget>[
                            FlatButton( 
                              onPressed: ((){
                                Navigator.pop(context);
                              }),
                              child: Text('OK'),  
                            ),
                          ],
                        );
                        },  
                      );  
                  }
                  else 
                  {
                  if(q1[counter].answ==true)
                  {
                    setState((){
                    ico.add(
                      Icon(Icons.check,color:Colors.green),
                    );
                    });
                  }
                  
                  else 
                  {
                    setState((){
                    ico.add(
                      Icon(Icons.close,color:Colors.red),
                    );
                    });
                  }                
                    counter++;
                  }

                }),                
                child: Text('true',style: TextStyle(color:Colors.white),),             
                  color: Colors.lightGreen,
              ),
             ),
          ), 
      ),  
              
          
            Expanded(
             child:Padding   
            (  
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
             
             child:Card(
               color: Colors.redAccent,
             child:RaisedButton( 
               
               hoverColor:Colors.red,
                onPressed:((){
                  if(counter==4)
                  {
                      // show the dialog  
                      showDialog(  
                        context: context,  
                        builder: (BuildContext context) {  
                          return  AlertDialog( 
                          title: Text('Simple Game'),
                          content: Text('Game Over restart to play again'),
                          actions: <Widget>[
                            FlatButton( 
                              onPressed: ((){
                                Navigator.pop(context);
                              }),
                              child: Text('OK'),  
                            ),
                          ],
                        );
                        },  
                      );
                  }
                  else 
                  {
                  if(q1[counter].answ==false)
                  {
                    setState((){
                    ico.add(
                      Icon(Icons.check,color:Colors.green),
                    );
                    });
                  }
                  else 
                  {
                    setState((){
                    ico.add(
                      Icon(Icons.close,color:Colors.red),
                    );
                    });
                  }  
                    counter++;
                  }
                                       
                  
                }),                
                child: Text('false',style: TextStyle(color:Colors.white),),             
                  color: Colors.redAccent,
              ),// RaisedButton 
             ),//Card        
          ),// Padding      
      ),// Expanded


      Row(
        children:ico,
      ),

        ],
      ),

    );
  }
}