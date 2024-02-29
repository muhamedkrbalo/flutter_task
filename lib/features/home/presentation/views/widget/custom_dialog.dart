import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/helpers/app_images/app_images.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';

customDialog(BuildContext context) {
    return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xffF9F1F1),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImages.deleteIcon,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text('Delete'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Are you sure you want to delete the profilefrom home page?',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.purpleColor,
                                            AppColors.pinkColor,
                                            AppColors.rosyColor,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      ),
                                      height: 50,
                                      child: const Center(
                                        child: Text(
                                          'OK',
                                          style:
                                              TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.lightColor),
                                      height: 50,
                                      child:
                                          const Center(child: Text('skip')),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
  }
