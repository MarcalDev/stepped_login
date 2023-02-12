import 'package:flutter/material.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

import '../views/stylePages/app_borders.dart';

class TextFormFieldWidget extends StatefulWidget {
    const TextFormFieldWidget({
    this.hintText = "",
    required this.editingController,
    this.isLastField = false,
    this.fieldRequirements = const [],
    this.labelText = '',
    super.key
    });
    final String hintText;
    final String labelText;
    final TextEditingController editingController;   
    final bool isLastField;
    final List<String>? fieldRequirements;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    bool showRequirementsList = widget.fieldRequirements!.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autocorrect: false,
          decoration: InputDecoration(        
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.inputHintColor),
            enabledBorder: AppBorders.textInputBorder,
            focusedBorder: AppBorders.textInputBorder,
            errorBorder: AppBorders.textInputBorderError,
            focusedErrorBorder: AppBorders.textInputBorderError,
            fillColor: Colors.white,
            filled:true,
            hoverColor: AppColors.inputBackgroundColor,
            floatingLabelBehavior: (widget.labelText != null) ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
            labelText: widget.labelText,
            labelStyle: TextStyle(color: AppColors.inputTextColor, backgroundColor: Colors.transparent),            
          ),
        controller: widget.editingController,
        cursorColor: AppColors.thirdColor,
        textAlign: TextAlign.left,
        textInputAction: (widget.isLastField) ? TextInputAction.done : TextInputAction.next,     
        validator: (_) {return (showRequirementsList) ? widget.fieldRequirements![0] : null;},
        autovalidateMode: AutovalidateMode.always,
        ),        
      ],
    )
    );
  }
}