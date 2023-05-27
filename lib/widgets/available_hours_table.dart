import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import 'custom_form_field.dart';

class TimeTable extends StatefulWidget {
 final List<String> daysOfWeek;
 final List<TextEditingController> fromControllers;
 final List<TextEditingController> toControllers;
 final List<TextEditingController> resetFromControllers;
 final List<TextEditingController> resetToControllers;
  const TimeTable({super.key,required this.daysOfWeek, required this.fromControllers, required this.toControllers, required this.resetFromControllers, required this.resetToControllers});

  @override
  TimeTableState createState() => TimeTableState();
}

class TimeTableState extends State<TimeTable> {
  List<TimeOfDay> fromTimes = List.generate(7, (index) => const TimeOfDay(hour: 0, minute: 0));
  List<TimeOfDay> toTimes = List.generate(7, (index) => const TimeOfDay(hour: 0, minute: 0));
  List<TimeOfDay> resetFromTimes = List.generate(7, (index) => const TimeOfDay(hour: 0, minute: 0));
  List<TimeOfDay> resetToTimes = List.generate(7, (index) => const TimeOfDay(hour: 0, minute: 0));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        dividerThickness: 0.0,
        decoration: BoxDecoration(
          border:Border.all(width: 1.sp,color: ColorManager.lightGrey),
          borderRadius: BorderRadius.circular(8.r),
          color:Colors.white,
        ),
        columns: [
          const DataColumn(label: Text('Day')),
          const DataColumn(label: Text('From')),
          const DataColumn(label: Text('To')),
          const DataColumn(label: Text('Reset Time')),
        ],
        rows: List<DataRow>.generate(
          widget.daysOfWeek.length,
              (index) => DataRow(cells: [
            DataCell(Text(widget.daysOfWeek[index])),
            DataCell(_buildTimePickerTextField(context, fromTimes, widget.fromControllers, index)),
            DataCell(_buildTimePickerTextField(context, toTimes, widget.toControllers, index)),
            DataCell(_buildResetTimeButtons(context, index)),
          ]),
        ),
      ),
    );
  }

  Widget _buildTimePickerTextField(BuildContext context, List<TimeOfDay> timeList, List<TextEditingController> controllers, int index,{String? hint}) {
    return CustomPickerTextField(
      hint: hint,
      controller: controllers[index],
      onTap: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          context: context,
          initialTime: timeList[index],
        );
        if (selectedTime != null) {
          setState(() {
            timeList[index] = selectedTime;
            controllers[index].text = selectedTime.format(context);
          });
        }
      },
    );
  }

  Widget _buildResetTimeButtons(BuildContext context, int index) {
    return Row(
      children: [
        _buildTimePickerTextField(context, resetFromTimes, widget.resetFromControllers, index,hint: 'From'),
        const SizedBox(width: 8),
        _buildTimePickerTextField(context, resetToTimes, widget.resetToControllers, index, hint: 'To'),
      ],
    );
  }
}