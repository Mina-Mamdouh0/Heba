
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haba/bloc/app_cubit.dart';
import 'package:haba/bloc/app_state.dart';
import 'package:haba/constant.dart';
import 'package:haba/screens/details_item_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGridView=true;
  final List<Column> myProducts = <Column>[
    Column(
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
      const SizedBox(width: 5,),
    ],
  ),
    Column(
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
      const SizedBox(width: 5,),


    ],
  )];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit,AppState>(
        builder: (context, state){
          var cubit=AppCubit.get(context);
          return RefreshIndicator(
            onRefresh: ()async{
              cubit.getDateHome(cityId: '-1', categoryId: '-1', countryId: '-1');
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: (){
                              setState(() {
                                isGridView=true;
                              });
                            },
                            child: SvgPicture.asset("assets/images/th.svg")),
                        const SizedBox(
                          width : 22.0,
                        ),
                        InkWell(
                            onTap: (){
                              setState(() {
                                isGridView=false;
                              });
                            },
                            child: SvgPicture.asset("assets/images/list.svg")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),
                  (state is LoadingGetItemHome)?
                  const Center(
                    child: CircularProgressIndicator()
                  ):isGridView ?
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.itemList.length,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsItemScreen(
                              itemModel: cubit.itemList[index],
                            )));
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
                                    child: CachedNetworkImage(
                                      imageUrl: '${Constant.baseUrl}/${cubit.itemList[index].imagesModel![0].image??''}',
                                      fit: BoxFit.cover,
                                      width: 200,
                                      placeholder: (context, url) =>  const Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) => Image.asset('${Constant.imagePath}${'cover.png'}'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:2),
                                  child: Text(cubit.itemList[index].title??'',style: TextStyle(
                                    color: Constant.blackColor,fontWeight: FontWeight.w700,fontSize: 18,
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(cubit.itemList[index].description??'',
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
                                      Text(cubit.itemList[index].cityModel!.name??'',
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
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.itemList.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsItemScreen(
                              itemModel: cubit.itemList[index],
                            )));
                          },

                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Constant.blackColor,
                                )
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius:const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: cubit.itemList[index].imagesModel![0].image??'',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>  const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Image.asset('${Constant.imagePath}${'cover.png'}'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:2),
                                  child: Text(cubit.itemList[index].title??'',style: TextStyle(
                                    color: Constant.blackColor,fontWeight: FontWeight.w700,fontSize: 18,
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(cubit.itemList[index].description??'',
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
                                      Text(cubit.itemList[index].cityModel!.name??'',
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
                        ),
                      );
                    },
                  ),




                ],
              ),
            ),
          );
        },
        listener: (context,state){

        },
      )
    );
  }
}
