import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomePanel extends StatelessWidget {
  const HomePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // ignore: avoid_redundant_argument_values
      
      
      children: <Widget>[
         Container(
         
            child: Column(
              children: [
                   Image.asset('assets/images/teamgodz.gif',height: 450,width: 280,alignment: Alignment.bottomCenter),
                ButtonTheme(
          minWidth: 150,
          
          height: 200,
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: baseColor, // foreground
  ),
           
            child: const Text('Play With GODZILLA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            
            
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/play/basic");
            },

            
          ),
          
        ),
             
            
      ]
          ),
         ), 
       
          Container(
         
            child: Column(
              children: [
                 Image.asset('assets/images/team_kon.gif',height: 450,width: 250,alignment: Alignment.bottomCenter),
        ButtonTheme(
        
          padding: EdgeInsets.only(top: 50),
         
             child: ElevatedButton(
            style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: baseColor, // foreground
  ),
           
            child: const Text('Play With KING-KONG' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            
            
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/play/advanced");
            },
           
          ),
        ),
              
            
      ]
          ),
         ), 
      ],
    );
  }
}
