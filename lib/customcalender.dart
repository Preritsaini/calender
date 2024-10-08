import 'package:flutter/material.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  late DateTime pickeddate;

  @override
  void initState() {
    super.initState();
    pickeddate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            title: Text('Date: ${pickeddate.year}-${pickeddate.month}-${pickeddate.day}',style: TextStyle(fontSize: 20),),
            trailing: const Icon(Icons.calendar_month),
            onTap: pickDate,
          ),
        ],
      ),
    );
  }

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: pickeddate,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (date != null) {
      setState(() {
        pickeddate = date;
      });
    }
  }
}
