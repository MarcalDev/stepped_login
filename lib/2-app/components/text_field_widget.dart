import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
    TextFieldWidget({
    required this.hintText,
    required this.editingController,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isPhoneArea = false,
    this.isEmail = false,
    this.isLastField = false,
    this.showErrorInput = false,
    this.fieldRequirements = const [],
    super.key
    });
    String hintText = "";
    TextEditingController editingController;
    bool isPassword;
    bool isPhoneNumber;
    bool isPhoneArea;
    bool isEmail;
    bool isLastField;
    bool showErrorInput;
    List<String> fieldRequirements;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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

  

  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    Color borderColor = (widget.showErrorInput) ? AppColors.errorColor : Colors.transparent;
    Color hintColor = (widget.showErrorInput) ? AppColors.errorColor : AppColors.inputHintColor;
    bool showRequirementsList = widget.fieldRequirements.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(      
          decoration: InputDecoration(        
            hintText: (!widget.isPhoneArea && !widget.isPhoneNumber) ? widget.hintText : ((widget.isPhoneArea)? "(00)" : "9999-999"),
            hintStyle: TextStyle(color: hintColor),
            enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: borderColor)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: borderColor)),
            fillColor: AppColors.inputBackgroundColor,
            isDense: false,
            filled:true,
            hoverColor: AppColors.inputBackgroundColor,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: AppColors.inputTextColor),
            suffixIcon: (widget.isPassword)
                        ? IconButton(
                          onPressed: (){
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          }, 
                          icon: Icon(
                            _showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: AppColors.thirdColor,
                            )
                          ): null,
          ),
        keyboardType: (widget.isPassword) ? TextInputType.visiblePassword : (widget.isPhoneNumber || widget.isPhoneArea) ? TextInputType.phone : (widget.isEmail) ? TextInputType.emailAddress : TextInputType.text,  
        obscureText: (widget.isPassword) ?  _showPassword : false,   
        controller: widget.editingController,
        inputFormatters: (widget.isPhoneNumber)? [phoneFormatter] : ((widget.isPhoneArea) ? [phoneAreaFormatter] : []),
        cursorColor: AppColors.thirdColor,
        textAlign: (widget.isPhoneArea) ? TextAlign.center : TextAlign.left,
        textInputAction: (widget.isLastField) ? TextInputAction.done : TextInputAction.next,       
      
        ),
        Visibility(
          visible: widget.showErrorInput,
          child: Padding(
            padding: EdgeInsets.only(left: 5,top: 5),
            child: Text("Obrigatório*", style: AppTextStyles.textLeftError, textAlign: TextAlign.left)
          )
        ),
        Visibility(
          visible: showRequirementsList,
          child: Padding(
            padding: EdgeInsets.only(left: 5,top: 5),
            child: Text(widget.fieldRequirements.toString().replaceAll('[', '').replaceAll(']', ''), style: AppTextStyles.textLeftError, textAlign: TextAlign.left),
          )
          )
      ],
    );
  }
}