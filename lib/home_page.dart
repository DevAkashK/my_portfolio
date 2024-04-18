import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_portfolio/common_widgets/icon_social_media.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
   double _height = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController=ScrollController();
  }

  void _animateToIndex(int index) {
    _scrollController.animateTo(
      index * (MediaQuery.of(context).size.height/2),
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Akash Khandagale"),
        actions: [
          Row(
            children: [
              TextButton(onPressed: (){
               _animateToIndex(0);
              }, child: Text("About")),
              TextButton(onPressed: (){
                _animateToIndex(1);
              }, child: Text("Skills")),
              TextButton(onPressed: (){
                _animateToIndex(2);
              }, child: Text("Portfolio")),
              TextButton(onPressed: (){
                _animateToIndex(3);
              }, child: Text("Contact"))
            ],
          )
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Welcome to My Portfolio"),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Hello world!',
                            textStyle: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 500),
                          ),
                        ],

                        totalRepeatCount: 4,
                        pause: const Duration(milliseconds: 500),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ],
                  ),
                *//*  Image.network("https://cdn.pixabay.com/photo/2017/08/06/06/18/laptop-2589420_1280.jpg",width: MediaQuery.of(context).size.width/3,)*//*
                ],
              ),
              Row(
                children: [
                  SocialMediaIcon(icon: MaterialCommunityIcons.whatsapp,onClick: (){
                    openInWindow("https://www.linkedin.com/in/akash-khandagale-78142b192/", "LinkedIn");
                  },),
                  SocialMediaIcon(icon: MaterialCommunityIcons.twitter,onClick: (){},),
                  SocialMediaIcon(icon: MaterialCommunityIcons.linkedin,onClick: (){},),
                  SocialMediaIcon(icon: MaterialCommunityIcons.github,onClick: (){},),
                ],
              ),*/
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4,bottom: MediaQuery.of(context).size.height/4),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: 4,
                    itemBuilder: (context, index) {
                  return  Container(
                  width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        child: Text("About me $index"),
                );
                }),
              )
             /* Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: Text("Portfolio"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: Text("Skills"),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: Text("Contact Me"),
              )*/
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );


  }

  void openInWindow(String uri, String name) {
    html.window.open(uri, name);
  }
}

