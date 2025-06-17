import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:jara_market/screens/job_completed/controller/job_completed_controller.dart';
import 'package:jara_market/screens/orders_screen/models/accepted_order.dart';
import 'package:jara_market/screens/orders_screen/models/models.dart';
import 'package:jara_market/widgets/custom_paint.dart';
import '../../widgets/status_bar.dart';

JobCompletedController controller = Get.put(JobCompletedController());

class JobCompletedScreen extends StatefulWidget {
  const JobCompletedScreen({super.key});

  @override
  State<JobCompletedScreen> createState() => _JobCompletedScreenState();
}

class _JobCompletedScreenState extends State<JobCompletedScreen> {
  

  int _parseTimeToSeconds(String time) {
    if (time.contains(":")) {
      // Format is likely MM:SS or HH:MM:SS
      final parts = time.split(":").map((e) => int.tryParse(e) ?? 0).toList();
      if (parts.length == 2) {
        return parts[0] * 60 + parts[1]; // MM:SS
      } else if (parts.length == 3) {
        return parts[0] * 3600 + parts[1] * 60 + parts[2]; // HH:MM:SS
      }
    } else {
      // Assume it's just seconds
      return int.tryParse(time) ?? 0;
    }
    return 0;
  }

  Color _fillColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    final myData = data as Data;
    final double size = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusBar(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.chevron_left_rounded),
                    ),
                    const Text(
                      'Job Details',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            //   const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                height: 600,
                decoration: const BoxDecoration(
                  //color: Coors,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey.shade500,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            myData.customer!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Order ID: ${myData.orderId}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        spacing: 20,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '₦${myData.price}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xffFA254C),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                spacing: 3,
                                children: [
                                  Text(
                                    myData.name!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w800,
                                      //fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    myData.unit!,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        //sfontWeight: FontWeight.w800,
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          // const SizedBox(width: 8),
                          // const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 3,
                                children: [
                                  SvgPicture.asset('assets/location.svg'),
                                  Text(
                                    'Drop-off',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: 'Mont',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Jara Market Store, Itam',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Mont',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Message',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Lorem ipsum dolor sit amet consectetur. Nibh malesuada nisi massa pulvinar gravida volutpat vitae consectetur.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Spacer(),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Order Cost',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '₦${myData.price!}',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: Column(
                    //     children: [
                    //       _buildCompletedStep('Shopping'),
                    //       _buildCompletedStep('Start delivery'),
                    //       _buildCompletedStep('Delivered'),
                    //     ],
                    //   ),
                    // ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Dotted circle behind (manually drawn with CustomPaint)
                        CustomPaint(
                          size: Size(size, size),
                          painter: DottedCirclePainter(
                            dotCount: 60,
                            color: Colors.grey[300]!,
                            strokeWidth: 4,
                          ),
                        ),

                        // Countdown Timer (fills up as it moves)
                        CircularCountDownTimer(
                          duration: 100,
                          initialDuration: 0,
                          controller: controller.countDownController,
                          width: size,
                          height: size,
                          ringColor: Colors.transparent,
                          fillColor: _fillColor,
                          backgroundColor: Colors.white,
                          strokeWidth: 3,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                            fontSize: 33.0,
                            color: _fillColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          textFormat: CountdownTextFormat.HH_MM_SS,
                          isReverse: true,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            debugPrint('Countdown Started');
                            controller.isStarted.value = true;
                            controller.isCompleted.value = false;
                          },
                          onComplete: () {
                            debugPrint('Countdown Ended');
                            WidgetsBinding.instance.addPostFrameCallback((_){
                              setState(() {
                                controller.isStarted.value = false;
                            controller.isCompleted.value = true;
                              });
                            });
                          },
                          onChange: (String timeStamp) {
                            // debugPrint('Countdown Changed $timeStamp');
                            //  setState(() {

                            //  });
                            int totalSecondsLeft =
                                _parseTimeToSeconds(timeStamp);
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                if (totalSecondsLeft <= 50 &&
                                    _fillColor != Colors.red) {
                                  _fillColor = Colors.red;
                                } else if (totalSecondsLeft <= 80 &&
                                    totalSecondsLeft > 50 &&
                                    _fillColor != Colors.amber) {
                                  _fillColor = Colors.amber;
                                }else if(controller.isCompleted.value && _fillColor != Colors.grey.shade500){
                                  _fillColor = Colors.grey.shade500;
                                }
                              });
                            });
                            debugPrint('Countdown Changed $totalSecondsLeft');
                          },
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            return duration.inSeconds == 0
                                ? 'Cancelled'
                                : Function.apply(
                                    defaultFormatterFunction, [duration]);
                          },
                        ),
                      ],
                    ),

                    //
                    //
                    // const Spacer(),
                    const SizedBox(height: 20,),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 90,
                            child: Obx(() {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor:  controller.isCompleted.value ? Colors.grey :const Color(0xffE83C00)),
                                onPressed: controller.isCompleted.value ? null : () {
                                 controller.acceptOrder(myData.itemId!.toString());
                               //  print("${myData.itemId!}, ");
                                  //_controller.reset();
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //   context,
                                  //   '/dashboard',
                                  //   (route) => false,
                                  // );
                                },
                                child: controller.isStarted.value
                                    ? const Text(
                                        'Deliver',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Mont',
                                            fontWeight: FontWeight.w600),
                                      )
                                    : controller.isCompleted.value ?  const Text(
                                        'Terminated',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Mont',
                                            fontWeight: FontWeight.w600),
                                      ) : const Text(
                                        'Accept',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Mont',
                                            fontWeight: FontWeight.w600),
                                      ),
                              );
                            })),
                        SizedBox(
                            width: 90,
                            child: Obx(() {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor:  controller.isCompleted.value ? Colors.grey :const Color(0xffE83C00)),
                                onPressed: () {
                               //   _controller.start();
                               
                                  //_controller.reset();
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //   context,
                                  //   '/dashboard',
                                  //   (route) => false,
                                  // );
                                },
                                child:  const Text(
                                        'Reject',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Mont',
                                            fontWeight: FontWeight.w600),
                                      ),
                              );
                            })),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedStep(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF9800),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
