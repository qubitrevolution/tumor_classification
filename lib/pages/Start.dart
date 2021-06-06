import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tumor_detection/pages/classifier.dart';
import 'package:url_launcher/url_launcher.dart';

class StartPage extends StatefulWidget {
  @override 
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

 @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: 
      Stack(
        children: 
            [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(image: AssetImage("Images/rk.png"),
                            fit: BoxFit.cover),
                          ),
                            
                            
                            child: Container(decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                              Colors.grey[300],
                              Colors.white.withOpacity(0)],
                              stops:[0.0,5],
                              begin: Alignment.bottomRight,
                              end: Alignment.topRight)
                              ),
                              child: Align(alignment: Alignment.bottomCenter,
                              child: Container(

                                margin:EdgeInsets.only(top: 300.0),
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  gradient:LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topRight,
                                 
                                  colors: [Colors.grey[300],Colors.grey[300]],

                                  ) ,
                                  ),)
                                
                                ),
                              ),
                      ),
                    ),
                    

                      Container(
                        
                        height: 200,
                          child: Column(
                            children: [
                              Text('Welcome', style: TextStyle(fontSize: 40 ,color: Colors.grey[600],fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('To use the classifier, select the classifier option below and to know more about machine learning select the know more option',style: TextStyle(fontSize: 20, color: Colors.grey[600]))),
                              )
                            ],
                          ),
                        ),
                        
                  ],
                ),
              ),
              
              SizedBox(width: 2000,),
              
              Padding(
            padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
 Padding(
                          padding: const EdgeInsets.all(10.0),
                         
                              child: InkWell(
                                child: Container(
                                  
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text('Know more',style: TextStyle(fontSize: 20 ,color: Colors.white))),
                                ),
                                 
                                height: 70,
                                width: 180,
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.pink[300],
                          boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        offset: Offset(4.0, 4.0),
                        spreadRadius: 1.0,
                        blurRadius: 15.0,
                      ),
                       BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        spreadRadius: 1.0,
                        blurRadius: 15.0,
                      ),],
                                ),
                            ),
                            onTap: (){
                                  openurl();
                                   },
                              ),
                          ),
                          SizedBox(width: 6,),
                        
                      ],),
              ),
            ),
          ],
      ),
    );
  }
  openurl()
  {
    String url1="https://qubitrevolution.blogspot.com/";
    launch(url1);
  }
}