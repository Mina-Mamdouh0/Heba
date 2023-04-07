
import 'package:flutter/material.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/details_item_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              child: Stack(
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search,color: Constant.greenColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.blackColor,
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Constant.redColor,
                              )
                          ),
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.g_translate,color: Constant.redColor,),
                          const SizedBox(width: 20,),
                          Icon(Icons.search,color: Constant.redColor,),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          value: 'e',
                          child: Text('Category'),
                        ),
                        DropdownMenuItem(
                          value: 'a',
                          child: Text('Category'),
                        ),
                      ], onChanged: (val){},
                      decoration:InputDecoration(
                        label: const Text('Category'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.blackColor,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.redColor,
                            )
                        ),
                      ) ),),
                  const SizedBox(width: 5,),
                  Expanded(child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          value: 'e',
                          child: Text('Category'),
                        ),
                        DropdownMenuItem(
                          value: 'a',
                          child: Text('Category'),
                        ),
                      ], onChanged: (val){},
                      decoration:InputDecoration(
                        label: const Text('Category'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.blackColor,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.redColor,
                            )
                        ),
                      ) ),),
                  const SizedBox(width: 5,),
                  Expanded(child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          value: 'e',
                          child: Text('Category'),
                        ),
                        DropdownMenuItem(
                          value: 'a',
                          child: Text('Category'),
                        ),
                      ], onChanged: (val){},
                      decoration:InputDecoration(
                        label: const Text('Category'),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.blackColor,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Constant.redColor,
                            )
                        ),
                      ) ),),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            GridView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200
                ),
                itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsItemScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Constant.blackColor,
                      )
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset('${Constant.imagePath}cover.png',fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:2),
                          child: Text('Title',style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.w700,fontSize: 18,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text('Desc Desc DescDescDescDescDescDescDescDescDescDescDescDescDescDesc',
                            softWrap: true,overflow: TextOverflow.ellipsis,textAlign: TextAlign.justify,
                            style: TextStyle(
                            color: Constant.blackColor,fontWeight: FontWeight.w300,fontSize: 16,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on_outlined,color: Constant.redColor,size: 16),
                              const SizedBox(width: 5,),
                              Text('Eygpt, ',
                                softWrap: true,overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                color: Constant.blackColor,fontWeight: FontWeight.w300,fontSize: 16,),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5,)


                      ],
                    ),
                  ),
                );
                })


          ],
        ),
      ),
    );
  }
}
