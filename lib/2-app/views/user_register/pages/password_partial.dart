import 'package:flutter/material.dart';

class password_partial extends StatefulWidget {
  const password_partial({Key? key}) : super(key: key);

  @override
  State<password_partial> createState() => _password_partialState();
}

class _password_partialState extends State<password_partial> {

  TextEditingController _password_controller = TextEditingController();
  TextEditingController _second_password_controller = TextEditingController();
  bool _show_first_password = true;
  bool _show_second_password = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextField(       
                keyboardType: TextInputType.visiblePassword,    
                obscureText: _show_first_password,   
                decoration: InputDecoration(
                labelText: "Digite sua senha" ,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _show_first_password = !_show_first_password;
                    });
                  }, 
                  icon: Icon(
                    _show_first_password
                    ? Icons.visibility_off
                    : Icons.visibility
                  )
                  )
              ),
              controller: _password_controller,
            ),
            ),            
            TextField(  
              keyboardType: TextInputType.visiblePassword,  
              obscureText: _show_second_password,   
                        
              decoration: InputDecoration(                
                labelText: "Repita a senha" ,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _show_second_password = !_show_second_password;
                    });
                  }, 
                  icon: Icon(
                    _show_second_password
                    ? Icons.visibility_off
                    : Icons.visibility
                  )
                  )
              ),
              controller: _second_password_controller,              
            ),
          ],
        )
      ),
    );
  }
}
