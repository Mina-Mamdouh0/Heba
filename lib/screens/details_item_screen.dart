
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:haba/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/item_model.dart';

class DetailsItemScreen extends StatelessWidget {
  final ItemModel itemModel;
  const DetailsItemScreen({Key? key, required this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.greenColor,
        title:  Text(itemModel.title??'',style: TextStyle(
          color:  Constant.blackColor,fontWeight: FontWeight.bold,
        )),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height:  MediaQuery.of(context).size.height*0.27,
              child: CachedNetworkImage(
                imageUrl: '${Constant.baseUrl}/${itemModel.imagesModel![0].image??''}',
                fit: BoxFit.cover,
                height:  MediaQuery.of(context).size.height*0.27,
                placeholder: (context, url) =>  const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset('${Constant.imagePath}${'cover.png'}',
                  fit: BoxFit.cover,
                  height:  MediaQuery.of(context).size.height*0.27,),
              ),
            ),


            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(itemModel.title??'',style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 22
              ),),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(itemModel.description??'',
                softWrap: true, overflow: TextOverflow.visible,
                style: TextStyle(
                  color: Constant.blackColor,fontWeight: FontWeight.w400,fontSize: 18,
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
                  Text(itemModel.userModel!.name??'',style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                  ),),
                  const SizedBox(height: 10,),
                  Text(itemModel.cityModel!.name??'',style: TextStyle(
                      color: Constant.blackColor,fontWeight: FontWeight.bold,fontSize: 20
                  ),),

                  itemModel.userModel!.mobileVerified!=null?
                  const SizedBox(height: 10,):Container(),

                  itemModel.userModel!.mobileVerified!=null?
                  MaterialButton(onPressed: ()async{
                    bool? res = await FlutterPhoneDirectCaller.callNumber(itemModel.userModel!.mobile??'');
                  },
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
                  ):Container(),

                  itemModel.userModel!.emailVerified!=null?
                  const SizedBox(height: 10,):Container(),
                  itemModel.userModel!.emailVerified!=null?
                  MaterialButton(onPressed: ()async{
                    if (await canLaunch("mailto:${itemModel.userModel!.email??''}")) {
                    await launch("mailto:${itemModel.userModel!.email??''}");
                    } else {
                    throw 'Could not launch';
                    }
                  },
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
                  ):Container(),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
