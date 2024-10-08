import 'package:flutter/material.dart';
import 'package:trialapp/customcalender.dart';
import 'package:trialapp/newcalender.dart';
import 'package:trialapp/trial.dart';

import 'dribble.dart';
import 'newdribble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DateCal(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 10.0,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(

                expandedHeight: 200.0,
                floating: true,
                snap: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeInImage(
                    placeholder: NetworkImage('https://fastly.picsum.photos/id/24/4855/1803.jpg'),
                    fadeInDuration: Durations.short1,
                    image: const NetworkImage(
                      'https://i.ibb.co/yYFkjx2/240-F-601171862-l7y-Z0wujj8o2-Sowi-KTUsf-LEEx8-Kun-YNd.jpg', // Example background image

                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Column(
                      children: [
                        // Replacing the big container with a PageView
                        Container(
                          height: 300,
                          width: 380,
                          child: PageView.builder(
                            itemCount: 3, // Number of pages in the PageView
                            itemBuilder: (context, pageIndex) {
                              return Container(
                                color: pageIndex % 2 == 0 ? Colors.red : Colors.blue, // Alternate colors

                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        // GridView inside the SliverList
                        Container(
                          height: 200,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(), // To disable inner grid scroll
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 4, // Number of items in the grid
                            itemBuilder: (BuildContext context, int gridIndex) {
                              return Container(
                                color: Colors.blue[100 * (gridIndex + 1)],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                  childCount: 10, // Total number of containers
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text("$index"),
                    );
                  },
                  childCount: 10,
                ),
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(''),
                content: const Text(''),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    icon: const Icon(Icons.dangerous),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
