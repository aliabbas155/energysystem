import 'package:energysystem/Screens/MainFunctionalities/unitconsumption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Timeselectionforhistory extends StatefulWidget {
  const Timeselectionforhistory({super.key});

  @override
  _TimeselectionforhistoryState createState() =>
      _TimeselectionforhistoryState();
}

class _TimeselectionforhistoryState extends State<Timeselectionforhistory> {
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime(2024, 12, 31),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      setState(() {
        if (isStartDate) {
          _startDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime!.hour,
            pickedTime.minute,
          );
          _startTime = pickedTime;
        } else {
          _endDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime!.hour,
            pickedTime.minute,
          );
          _endTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black, // Customize arrow color here
          ),
          onPressed: () {
            // Define what happens when back arrow is pressed
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 172, 199, 218),
                    Color(0xFFE3F2FD),
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/wattlogo.png',
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'WATT',
                    style: TextStyle(
                      color: const Color(0XFFF6A300),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: 'Lora-VariableFont_wght.ttf',
                    ),
                  ),
                  Text(
                    'TRACK',
                    style: TextStyle(
                      color: const Color(0XFF508BFF),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: 'Lora-VariableFont_wght.ttf',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Text(
              'Please Select the timeline for consumption history.',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                fontFamily: 'Lora-VariableFont_wght.ttf',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40.h,
                  width: 250.h,
                  color: const Color.fromARGB(255, 207, 205, 205),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          _startDate != null
                              ? 'From: ${_startDate!.toString().split(' ')[0]} ${_startTime!.format(context)}'
                              : 'From',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.access_time, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40.h,
                  width: 250.h,
                  color: const Color.fromARGB(255, 207, 205, 205),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          _endDate != null
                              ? 'To: ${_endDate!.toString().split(' ')[0]} ${_endTime!.format(context)}'
                              : 'To',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.access_time, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return SizedBox(
      height: 40.h,
      width: 250.w,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UnitConsumption(
                startDate: _startDate,
                startTime: _startTime,
                endDate: _endDate,
                endTime: _endTime,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF508BFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontFamily: 'Lora-VariableFont_wght.ttf',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
