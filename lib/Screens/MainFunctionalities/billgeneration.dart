import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillGeneration extends StatefulWidget {
  const BillGeneration({super.key});

  @override
  State<BillGeneration> createState() => _BillGenerationState();
}

class _BillGenerationState extends State<BillGeneration> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;

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
          children: [
            _buildHeader(),
            _buildDropdown(),
            _buildBillItems(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 0.w),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 172, 199, 218),
              Color(0xFFE3F2FD),
            ],
          ),
          borderRadius: BorderRadius.circular(10.0),
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
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bill Generation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 40.h,
              width: 100.w,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text(
                    ' Time',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 160,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0XFF508BFF),
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    iconSize: 20,
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color(0XFF508BFF),
                    ),
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillItems() {
    return Padding(
      padding: EdgeInsets.only(top: 50.w),
      child: Column(
        children: [
          _buildBillItem('Electricity Slab', 'Rs 7.9 / units'),
          _buildBillItem('Energy Consumed', '700 units'),
          _buildBillItem('Fixed Charge', 'Rs 250'),
          _buildBillItem('Total Amount', 'Rs 5650'),
          _buildBillItem('Tax Charges', 'Rs 2800'),
          _buildBillItem('Net Total', 'Rs 8500',
              backgroundColor: const Color(0XFFF6A300)),
        ],
      ),
    );
  }

  Widget _buildBillItem(String title, String value,
      {Color backgroundColor = const Color(0XFF508BFF)}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.w),
      child: Container(
        height: 40.h,
        width: 320.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return SizedBox(
      height: 40.h,
      width: 130.w,
      child: ElevatedButton(
        onPressed: () {
          // Add your onPressed logic here
          print('Button Pressed');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF508BFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Calculate',
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
