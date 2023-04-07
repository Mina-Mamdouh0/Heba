
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba/constant.dart';

class DetailsItemScreen extends StatelessWidget {
  const DetailsItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text('Title',style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height:  MediaQuery.of(context).size.height*0.27,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('${Constant.imagePath}cover.png'),
                  )
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Formal since the fifteenth century when an release of Letraset chips.',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 22
              ),),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('''
Formal since the fifteenth century when an unknown printing press stacked a group of letters randomly taken from a text, to be a booklet as a guide or a formal reference for these letters. Five centuries did not eliminate this text, but it even became used in its original form in printing and electronic typesetting. It became popular in the 1960s with the release of Letraset chips.
              ''',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
              ),),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0XFFD9D9D9)
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Information',style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18
                  ),),
                  const SizedBox(height: 10,),
                  Text('Name',style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                  ),),
                  const SizedBox(height: 10,),
                  Text('Egypt',style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                  ),),
                  const SizedBox(height: 10,),
                  MaterialButton(onPressed: (){},
                  color: Constant.greenColor,
                      padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const  [
                        Icon(Icons.email,color: Colors.white,size: 22,),
                         SizedBox(width: 10,),
                        Text('Call',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                        ),)
                      ],
                    )
                  ),
                  const SizedBox(height: 10,),
                  MaterialButton(onPressed: (){},
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Constant.blackColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          Icon(Icons.mail_outline,color: Constant.blackColor,size: 22,),
                          const SizedBox(width: 10,),
                          Text('Send',
                            style: TextStyle(
                                color: Constant.blackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                            ),)
                        ],
                      )
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
