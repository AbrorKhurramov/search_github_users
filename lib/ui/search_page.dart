import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:search_github_users/controller/main_controller.dart';

import '../core/theme/app_colors.dart';




class SearchPage extends GetView<MainController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder:(controller) => Container(
      decoration: const BoxDecoration(
          image:  DecorationImage(
              image: AssetImage("assets/png/background_image.png"), fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SvgPicture.asset("assets/svg/github_logo.svg",width: 120,height: 120,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 58,vertical: 100),
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30) ,
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                       const SizedBox(width: 17),
                       SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(
                            child: SvgPicture.asset("assets/svg/search_icon.svg",color: AppColors.grey),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.userNameController,
                            onChanged: (v) {

                            },
                            onFieldSubmitted: (v){
                              //   controller.setSearch(v);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search by username',
                              hintStyle: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            cursorColor: AppColors.black,
                            cursorWidth: 0.8,
                          ),
                        ),

                       ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>controller.getUsersList(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25,left: 120,right: 120,top: 40),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child:const Center(child: Text("GO",textAlign: TextAlign.center,style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w500,fontSize: 15),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
