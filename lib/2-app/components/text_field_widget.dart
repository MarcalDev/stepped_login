import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stepped_login/2-app/views/stylePages/app_colors.dart';
import 'package:stepped_login/2-app/views/stylePages/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
    TextFieldWidget({
    this.hintText = "",
    required this.editingController,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isPhoneArea = false,
    this.isEmail = false,
    this.isLastField = false,
    this.showErrorInput = false,
    this.fieldRequirements = const [],
    required this.labelText,
    super.key
    });
    String hintText;
    String labelText = "";
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
    Color borderColor = (widget.showErrorInput) ? AppColors.errorColor : AppColors.inputTextColor;
    Color labelColor = (widget.showErrorInput) ? AppColors.errorColor : AppColors.inputTextColor;
    bool showRequirementsList = widget.fieldRequirements.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(      
          decoration: InputDecoration(        
            hintText: (!widget.isPhoneArea && !widget.isPhoneNumber) ? widget.hintText : ((widget.isPhoneArea)? "(00)" : "9999-999"),
            hintStyle: TextStyle(color:  AppColors.inputHintColor),
            enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: borderColor)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: borderColor)),
            fillColor: Colors.white,
            isDense: false,
            filled:true,
            hoverColor: AppColors.inputBackgroundColor,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: widget.labelText,
            labelStyle: TextStyle(color: labelColor, backgroundColor: Colors.transparent),
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
          visible: widget.showErrorInput && !showRequirementsList,
          child: Padding(
            padding: EdgeInsets.only(left: 5,top: 5),
            child: Text("Obrigatório*", style: AppTextStyles.textLeftError, textAlign: TextAlign.left)
          )
        ),
        Visibility(
          visible: showRequirementsList,
          child: Padding(
            padding: EdgeInsets.only(left: 5,top: 5),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: widget.fieldRequirements.length,
              itemBuilder: (context, index) {
              return Text(widget.fieldRequirements[index], style: AppTextStyles.textLeftError, textAlign: TextAlign.left);
            },)
          )
          )
      ],
    )
    );
  }
}