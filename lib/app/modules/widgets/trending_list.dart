// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';
//
// import '../home/controllers/home_controller.dart';
// import '../shop/views/video_player.dart';
// import '../utill/app_size.dart';
// import '../utill/constant.dart';
//
// Widget trendingList(HomeController controller) {
//   // VlcPlayerController _videoPlayerController = VlcPlayerController.network(
//   //   'https://media.w3.org/2010/05/sintel/trailer.mp4',
//   //   autoPlay: false,
//   //   options: VlcPlayerOptions(),
//   // );
//
//   return Obx(() => controller.isTrendingProductLoading.value == true
//       ? Center(
//           child: Lottie.asset("assets/json/loading.json",
//               fit: BoxFit.cover,
//               height: screenHeight * 0.095,
//               width: screenWidth * 0.095),
//         )
//       :
//       // VlcPlayer(
//       //         controller: VlcPlayerController.network(
//       //           'https://media.w3.org/2010/05/sintel/trailer.mp4',
//       //           autoPlay: true,
//       //           options: VlcPlayerOptions(),
//       //         ),
//       //         aspectRatio: 16 / 9,
//       //         placeholder: Center(child: CircularProgressIndicator()),
//       //       )
//       // );
//       ListView.builder(
//           itemCount: controller.trendingProduct.value.data!.length,
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             // VlcPlayerController _videoPlayerController =
//             //     VlcPlayerController.network(
//             //   controller.trendingProduct.value.data![index].video.toString(),
//             //   autoPlay: true,
//             //   options: VlcPlayerOptions(),
//             // );
//
//             String url =
//                 "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
//             // YoutubePlayer.convertUrlToId(IMAGE_HEADER +
//             //     controller.trendingProduct.value.data![index].video
//             //         .toString())!;
//             return
//
//                 //   VlcPlayer(
//                 //   controller: VlcPlayerController.network(
//                 //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//                 //     // IMAGE_HEADER +
//                 //     //     controller.trendingProduct.value.data![index].video
//                 //     //         .toString(),
//                 //     autoPlay: true,
//                 //     options: VlcPlayerOptions(),
//                 //   ),
//                 //   aspectRatio: 16 / 9,
//                 //   placeholder: Center(child: CircularProgressIndicator()),
//                 // );
//                 Container(
//               margin: EdgeInsets.only(
//                   left: screenWidth * 0.015, right: screenWidth * 0.015),
//               height: screenHeight * 0.75,
//               width: screenWidth * 0.35,
//               child: Stack(
//                 children: [
//                   controller.trendingProduct.value.data![index].videoStatus == 1
//                       ? AspectRatio(
//                           aspectRatio: 10 / 9,
//                           child: Container(
//                             width: 30.w,
//                             decoration: const BoxDecoration(),
//                             child: VideoApp(
//                               videoLink:
//                                   '$IMAGE_HEADER${controller.trendingProduct.value.data![index].video}',
//                             ),
//                           )
//
//                           // VlcPlayer(
//                           //   controller:
//                           //
//                           //   VlcPlayerController.network(
//                           //     // 'https://enorsia.com/upload/trending/1689087761m1hHZBkRBV-trending-video.mp4',
//                           //     // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//                           //     IMAGE_HEADER + controller.trendingProduct.value.data![index].video
//                           //             .toString(),
//                           //     autoPlay: true,
//                           //     options: VlcPlayerOptions(
//                           //       http: VlcHttpOptions([
//                           //         VlcHttpOptions.httpReconnect(true),
//                           //       ]),
//                           //       rtp: VlcRtpOptions([
//                           //         VlcRtpOptions.rtpOverRtsp(true),
//                           //       ]),
//                           //     ),
//                           //   ),
//                           //
//                           //
//                           //
//                           //   aspectRatio: 8 / 7,
//                           //   placeholder: Center(
//                           //       child: Lottie.asset("assets/json/loading.json",
//                           //           fit: BoxFit.cover,
//                           //           height: screenHeight * 0.045,
//                           //           width: screenWidth * 0.045)),
//                           // ),
//
//                           )
//                       // YoutubePlayer(
//                       //     aspectRatio: 9 / 6,
//                       //     controller: YoutubePlayerController(
//                       //       initialVideoId: YoutubePlayer.convertUrlToId(
//                       //           IMAGE_HEADER +
//                       //               controller.trendingProduct.value
//                       //                   .data![index].video
//                       //                   .toString())!,
//                       //       flags: YoutubePlayerFlags(
//                       //         controlsVisibleAtStart: false,
//                       //         hideControls: true,
//                       //         autoPlay: true,
//                       //         mute: true,
//                       //       ),
//                       //       // Place additional customization options here
//                       //     ),
//                       //     showVideoProgressIndicator: true,
//                       //   )
//                       : Container()
//
//                   // Image.asset(
//                   //   "assets/images/banner_demo_image.png",
//                   //   height: screenHeight * 0.18,
//                   //   width: screenWidth * 0.25,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   // controller.trendingProduct.value.data![index].videoStatus != 1
//                   //     ? FadeInImage(
//                   //         image: NetworkImage(IMAGE_HEADER +
//                   //             controller
//                   //                 .trendingProduct.value.data![index].image
//                   //                 .toString()),
//                   //         placeholder:
//                   //             AssetImage('assets/images/banner_demo_image.png'),
//                   //         fit: BoxFit.cover,
//                   //         imageErrorBuilder: (context, error, stackTrace) {
//                   //           return Image.asset(
//                   //             "assets/images/banner_demo_image.png",
//                   //             height: screenHeight * 0.18,
//                   //             width: screenWidth * 0.25,
//                   //             fit: BoxFit.cover,
//                   //           );
//                   //         },
//                   //         height: screenHeight * 0.18,
//                   //         width: screenWidth * 0.25,
//                   //       )
//                   //     : YoutubePlayer(
//                   //         aspectRatio: 9 / 6,
//                   //         controller: YoutubePlayerController(
//                   //           initialVideoId: url,
//                   //           flags: YoutubePlayerFlags(
//                   //             controlsVisibleAtStart: false,
//                   //             hideControls: true,
//                   //             autoPlay: true,
//                   //             mute: true,
//                   //           ),
//                   //           // Place additional customization options here
//                   //         ),
//                   //         showVideoProgressIndicator: true,
//                   //       ),
//                   // Align(
//                   //   alignment: Alignment.bottomCenter,
//                   //   child: Container(
//                   //     margin: EdgeInsets.only(top: screenHeight * 0.050),
//                   //     alignment: Alignment.bottomCenter,
//                   //     child: Center(
//                   //       child: Text(
//                   //         "Women",
//                   //         style: GoogleF FadeInImage(
//                   //                     image: NetworkImage(IMAGE_HEADER +
//                   //                         controller.trendingProduct.value.data![index].image
//                   //                             .toString()),
//                   //                     placeholder:
//                   //                         AssetImage('assets/images/banner_demo_image.png'),
//                   //                     fit: BoxFit.cover,
//                   //                     imageErrorBuilder: (context, error, stackTrace) {
//                   //                       return Image.asset(
//                   //                         "assets/images/banner_demo_image.png",
//                   //                         height: screenHeight * 0.18,
//                   //                         width: screenWidth * 0.25,
//                   //                         fit: BoxFit.cover,
//                   //                       );
//                   //                     },
//                   //                     height: screenHeight * 0.18,
//                   //                     width: screenWidth * 0.25,
//                   //                   ),onts.ruluko(
//                   //             fontSize: screenWidth * 0.050,
//                   //             color: Colors.white,
//                   //             fontWeight: FontWeight.bold),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // )
//                 ],
//               ),
//             );
//           }));
//   // ListView.builder(
//   //   itemCount: 5,
//   //   shrinkWrap: true,
//   //   scrollDirection: Axis.horizontal,
//   //   itemBuilder: (context, index) {
//   //     return Container(
//   //       margin: EdgeInsets.only(left: 25.0, right: 25.0),
//   //       width: screenWidth * 0.25,
//   //       child: Stack(
//   //         children: [
//   //           ClipRRect(
//   //             borderRadius: BorderRadius.circular(12.0),
//   //             child: Image.asset(
//   //               "assets/images/placeholder_image.png",
//   //               height: screenHeight * 0.18,
//   //               width: screenWidth * 0.25,
//   //               fit: BoxFit.cover,
//   //             ),
//   //           ),
//   //           Align(
//   //             alignment: Alignment.bottomCenter,
//   //             child: Container(
//   //               margin: EdgeInsets.only(top: screenHeight * 0.050),
//   //               alignment: Alignment.bottomCenter,
//   //               child: Center(
//   //                 child: Text(
//   //                   "Trending",
//   //                   style: GoogleFonts.ruluko(
//   //                       fontSize: screenWidth * 0.050,
//   //                       fontWeight: FontWeight.bold),
//   //                 ),
//   //               ),
//   //             ),
//   //           )
//   //         ],
//   //       ),
//   //     );
//   //   });
// }
