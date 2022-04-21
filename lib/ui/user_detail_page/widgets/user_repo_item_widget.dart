import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';




class UserRepoItemWidget extends StatelessWidget {
   UserRepoItemWidget({Key? key,required this.onTap,required this.name,required this.description,required this.watchersCount,required this.starsCount,required this.forksCount}) : super(key: key);
   GestureTapCallback onTap;
   String name;
   String description;
   int watchersCount;
   int starsCount;
   int forksCount;
  @override
  Widget build(BuildContext context) {
    return         InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        color: AppColors.white,
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 15),
            Padding(
              padding:
              const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight:
                                FontWeight
                                    .bold),
                          ),
                          const SizedBox(
                              height: 3),
                          SizedBox(
                              width:
                              Get.width - 50,
                              child: Text(
                                description,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color:
                                    AppColors
                                        .grey),
                                maxLines: 2,
                              )),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/watching.svg",
                            width: 13,
                            height: 13,
                          ),
                          const SizedBox(width: 8),
                          Text(
                              "$watchersCount"),
                          const SizedBox(width: 25),
                          SvgPicture.asset(
                            "assets/svg/star.svg",
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(width: 8),
                          Text(
                              "$starsCount"),
                          const SizedBox(width: 25),
                          SvgPicture.asset(
                            "assets/svg/folks.svg",
                            width: 15,
                            height: 15,
                          ),
                          const SizedBox(width: 8),
                          Text(
                              "$forksCount"),
                        ],
                      )
                    ],
                  ),
                  const Icon(
                      Icons
                          .keyboard_arrow_right_outlined,
                      size: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
