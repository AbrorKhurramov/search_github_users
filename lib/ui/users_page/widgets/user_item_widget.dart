import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';




class UserItemWidget extends StatelessWidget {
 UserItemWidget({Key? key,required this.onTap,required this.imageUrl,required this.name}) : super(key: key);
 GestureTapCallback onTap;
String imageUrl;
String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        color: AppColors.white,
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CachedNetworkImage(imageUrl: imageUrl,height: 60,width: 60,)),

                    const SizedBox(width: 10),
                    Text(name),

                  ],
                ),
                const Padding(
                  padding:  EdgeInsets.only(right: 30),
                  child: Icon(
                      Icons
                          .keyboard_arrow_right_outlined,
                      size: 30),
                )
              ],
            ),

          ],
        ),

      ),
    );
  }
}
