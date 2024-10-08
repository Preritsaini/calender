import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Back')),
            )
          ],
        ),
      ),
    );
  }
}
