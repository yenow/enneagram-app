import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateDropDown extends StatefulWidget {
  final List<String> list;
  final Function(String date)? callback;
  const DateDropDown({super.key, required this.list, this.callback});

  @override
  State<DateDropDown> createState() => _DateDropDownState();
}

class _DateDropDownState extends State<DateDropDown> {
  late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.list.first;

    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      // elevation: 16,
      style: Get.textTheme.bodyText2,
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });

        if(widget.callback != null) {
          widget.callback!(value!);
        }
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
