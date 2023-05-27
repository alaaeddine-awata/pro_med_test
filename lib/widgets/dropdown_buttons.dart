import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  const CustomDropdownButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = const Offset(0, 0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          //To avoid long text overflowing.
          isExpanded: true,
          hint: Container(
            alignment: hintAlignment,
            child: Text(
              hint,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          value: value,
          items: dropdownItems
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Container(
              alignment: valueAlignment,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
          ))
              .toList(),
          onChanged: onChanged,
          selectedItemBuilder: selectedItemBuilder,
          buttonStyleData: ButtonStyleData(
            height: buttonHeight ?? 48.h,
            width: buttonWidth,
            padding: buttonPadding ?? EdgeInsets.only(left: 24.w, right: 20.w,),
            decoration: buttonDecoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: ColorManager.lightGrey,
                    width: 1.sp
                  ), boxShadow: [
                  BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 25,
                    blurStyle: BlurStyle.outer,
                )
              ]
                ),
            elevation: buttonElevation,
          ),
          iconStyleData: IconStyleData(
            icon: const RotatedBox(quarterTurns: 3,child: Icon(Icons.arrow_back_ios)),
            iconSize: iconSize ?? 14.sp,
            iconEnabledColor: ColorManager.primary,
            iconDisabledColor: ColorManager.primary,
          ),
          dropdownStyleData: DropdownStyleData(
            //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
            maxHeight: dropdownHeight ?? 200.h,
            width: dropdownWidth,
            padding: dropdownPadding,
            decoration: dropdownDecoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(width: 1.sp,color: ColorManager.lightGrey),
                ),
            elevation: dropdownElevation ?? 8.sp.toInt(),
            //Null or Offset(0, 0) will open just under the button. You can edit as you want.
            offset: offset,
            //Default is false to show menu below button
            isOverButton: false,
            scrollbarTheme: ScrollbarThemeData(
              radius: scrollbarRadius ?? Radius.circular(40.r),
              thickness: scrollbarThickness != null
                  ? MaterialStateProperty.all<double>(scrollbarThickness!)
                  : null,
              thumbVisibility: scrollbarAlwaysShow != null
                  ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                  : null,
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: itemHeight ?? 40.h,
            padding: itemPadding ?? EdgeInsets.only(left: 14.sp, right: 14.sp),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
 final List<String> items ;
  const CustomButton({Key? key, required this.items}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const RotatedBox(quarterTurns: 3,child: Icon(Icons.more_vert)),
        items: [
          ...widget.items.map(
                (item) => DropdownMenuItem<String>(
              value: item,
              child: Text.rich(TextSpan(
                children: [
                  TextSpan(text: item.substring(0,4),style: getSemiBoldStyle(color: ColorManager.textGrey,fontSize: 12.sp)),
                  TextSpan(text: item.substring(4),style: getSemiBoldStyle(color: ColorManager.black,fontSize: 12.sp)),
                ]
              )),
            ),
          ),
        ],
        onChanged: (v){},
        dropdownStyleData: DropdownStyleData(
          width: 200.w,
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: Colors.white,
          ),
          elevation: 8,
          offset: Offset(-200.w, 0),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(widget.items.length, 25.h),
          ],
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
        ),
      ),
    );
  }
}
