import 'package:flutter/material.dart';

class basic_data_partial extends StatefulWidget {
  const basic_data_partial({Key? key}) : super(key: key);

  @override
  State<basic_data_partial> createState() => _basic_data_partialState();
}

class _basic_data_partialState extends State<basic_data_partial> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _name_controller = TextEditingController();
  TextEditingController _phone_area_controller = TextEditingController();
  TextEditingController _phone_number_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [          
            TextField(              
              decoration: const InputDecoration(
                labelText: "Digite seu nome" ,
                border: OutlineInputBorder(),
              ),
              controller: _name_controller,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextField(
                decoration: const InputDecoration(
                labelText: "Digite seu e-mail" ,
                border: OutlineInputBorder(),
              ),
              controller: _email_controller,
            )
            ),            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 70,
                    padding: const EdgeInsets.all(0),
                    child: TextField(  
                      decoration: const InputDecoration(                    
                      labelText: "DDD" ,
                      border: OutlineInputBorder(),
                      ),
                      controller: _phone_area_controller,
                    )       
                  ),
                Container(
                    width: 265,
                    padding: const EdgeInsets.all(0),
                    child:  TextField(
                    decoration: const InputDecoration(
                      labelText: "Celular" ,
                      border: OutlineInputBorder(),
                    ),
                    controller: _phone_number_controller,
                  ),
                  
                )            
            ],
            )
          ],
          )
      ),
    );
  }
}
