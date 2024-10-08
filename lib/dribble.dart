import 'package:flutter/material.dart';
import 'package:trialapp/new.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: screenWidth * 0.8,
                width: screenWidth,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: screenWidth * 0.6,
                        width: screenWidth * 0.93,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Color(0xffef5350),
                              Color(0xffff8a65),
                              Color(0xffffe082),
                              Color(0xffffd54f),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Patient Profile',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.more_horiz),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context) =>
                              New()));
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://i.ibb.co/T0bY5ZZ/jurica-koletic-7-YVZYZe-ITc8-unsplash-1-1.jpg'),
                              radius: 60,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Jorge Wattson',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city_outlined,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          '  Napoli,Italia',
                          style: TextStyle(color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_2_rounded,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          '  Age: 64',
                          style: TextStyle(color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Text(
                          '   Norwood   ',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    'Jorge\'s Notes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'mfmkmvksms rmmskfmskfmsm rkmkfmskfmsk msfkmk fvsdkv sfkmfsknf sfdmsdmfvssmvmf kgomgrovomvgomd mkgrmdfmv'),
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    '3 Attachments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ...List.generate(
                          3,
                          (context) => Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.file_download,
                                            size: 100,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text('sjfsfkm.docx')
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              )),
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        children: [
                          Icon(Icons.pie_chart,color: Colors.deepPurpleAccent,),
                          SizedBox(width: 10),
                          Text('  25 credits   ')
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.indigo[400],
                          borderRadius: BorderRadius.circular(20),
                          ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text('          Get Details             ',
                          style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
