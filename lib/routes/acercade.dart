import 'package:flutter/material.dart';

class AcercadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 70, backgroundImage: AssetImage('assets/img/pluriverso.png')),

              SizedBox(
                height: 100.0,
                width: double.infinity,
                child: Padding(
                padding: const EdgeInsets.only(top: 45.0))
                ),    
                  
              Text(
                'Pluriversos Climaticos - Proyecto Anillos',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
               height: 20,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 8, 95, 33),
                ),
              ),
              Text(
                'Proyecto Geografico enfocado en mostrar atemporalmente cambios climaticos ya sean catastrofes naturales, como bellezas de la naturaleza y su estado actual',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 2.5,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                    ),
              ),
              
             
            
            ],
          ),
        ),
      ),
    );
  }
}