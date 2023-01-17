import 'package:flutter/material.dart';

class profile_pic_partial extends StatefulWidget {
  const profile_pic_partial({Key? key}) : super(key: key);

  @override
  State<profile_pic_partial> createState() => _profile_pic_partialState();
}

class _profile_pic_partialState extends State<profile_pic_partial> {
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Selecione sua foto de perfil"),
            Padding(
              padding: EdgeInsets.fromLTRB(0,45,0,20),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://miro.medium.com/max/1400/1*g09N-jl7JtVjVZGcd-vL2g.jpeg"),
                radius: 100,
                )
              ),            
            Text("Pular"),
          ],
        )
      )
      );
    
  }
}
