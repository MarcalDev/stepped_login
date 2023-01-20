import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';

class text_field_widget extends StatefulWidget {
    text_field_widget({
    required this.hint_text,
    required this.editing_controller,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isPhoneArea = false,
    this.isEmail = false,
    this.isLastField = false,
    super.key
    });
    String hint_text = "";
    TextEditingController editing_controller;
    bool isPassword;
    bool isPhoneNumber;
    bool isPhoneArea;
    bool isEmail;
    bool isLastField;



  @override
  State<text_field_widget> createState() => _text_field_widgetState();
}

class _text_field_widgetState extends State<text_field_widget> {
  var phoneFormatter = MaskTextInputFormatter(
    mask: '00000-0000', 
    filter: { "0": RegExp(r'[0-9]') },    
    type: MaskAutoCompletionType.lazy
  );
  var phoneAreaFormatter = MaskTextInputFormatter(
    mask: '( 00 )', 
    filter: { "0": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,    
  );

  bool _show_password = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(        
        hintText: (!widget.isPhoneArea && !widget.isPhoneNumber) ? widget.hint_text : ((widget.isPhoneArea)? "(00)" : "9999-999"),
        hintStyle: TextStyle(color: AppColors.inputHintColor),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.transparent)),
        fillColor: AppColors.inputBackgroundColor,
        filled:true,
        hoverColor: AppColors.inputBackgroundColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: AppColors.inputTextColor),
        suffixIcon: (widget.isPassword)
                    ? IconButton(
                      onPressed: (){
                        setState(() {
                          _show_password = !_show_password;
                        });
                      }, 
                      icon: Icon(
                        _show_password
                        ? Icons.visibility_off
                        : Icons.visibility
                        )
                      ): null,
      ),
      keyboardType: (widget.isPassword) ? TextInputType.visiblePassword : (widget.isPhoneNumber || widget.isPhoneArea) ? TextInputType.phone : (widget.isEmail) ? TextInputType.emailAddress : TextInputType.text,  
      obscureText: (widget.isPassword) ?  _show_password : false,   
      controller: widget.editing_controller,
      inputFormatters: (widget.isPhoneNumber)? [phoneFormatter] : ((widget.isPhoneArea) ? [phoneAreaFormatter] : []),
      cursorColor: AppColors.inputTextColor,
      textAlign: (widget.isPhoneArea) ? TextAlign.center : TextAlign.left,
      textInputAction: (widget.isLastField) ? TextInputAction.done : TextInputAction.next,        
    );
  }
}