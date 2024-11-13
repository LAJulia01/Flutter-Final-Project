import 'package:flutter/material.dart';

class AvailabilityPage extends StatefulWidget {
const AvailabilityPage({super.key});

  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime(bool isStartTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
        } else {
          endTime = pickedTime;
        }
      });
    }
  }

  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Customize color
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Select Availability"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: "poppins"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Date",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: "poppins"),
            ),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.black54),
                        SizedBox(width: 8),
                        Text(
                          selectedDate != null
                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                              : "Input Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontFamily: "poppins"),
                        ),
                      ],
                    ),
                    Icon(Icons.edit, color: Colors.black54),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Duty Hours",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: "poppins"),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickTime(true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.black54),
                        SizedBox(width: 8),
                        Text(
                          startTime != null
                              ? startTime!.format(context)
                              : "Start Time",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontFamily: "poppins"),
                        ),
                      ],
                    ),
                    Icon(Icons.edit, color: Colors.black54),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _pickTime(false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.black54),
                        SizedBox(width: 8),
                        Text(
                          endTime != null
                              ? endTime!.format(context)
                              : "End Time",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontFamily: "poppins"),
                        ),
                      ],
                    ),
                    Icon(Icons.edit, color: Colors.black54),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    endTime != null ? endTime!.format(context) : "Full Adress",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontFamily: "poppins"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Contact #",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: "poppins"),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    endTime != null
                        ? endTime!.format(context)
                        : "Enter the Number",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontFamily: "poppins"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isAvailable,
                      onChanged: (bool? value) {
                        setState(() {
                          isAvailable = value!;
                        });
                      },
                    ),
                    Text("Available"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: isAvailable,
                      onChanged: (bool? value) {
                        setState(() {
                          isAvailable = value!;
                        });
                      },
                    ),
                    Text("Not Available"),
                  ],
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save the availability data here
                  print("Selected Date: $selectedDate");
                  print("Start Time: ${startTime?.format(context)}");
                  print("End Time: ${endTime?.format(context)}");
                  print("Available: $isAvailable");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Availability Saved')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                  backgroundColor: const Color(0xFFF5A7A5),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 12, fontFamily: "poppins", color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}