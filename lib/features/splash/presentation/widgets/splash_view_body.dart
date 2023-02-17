import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';

import '../../../../core/utils/constants.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();

    _initSlidingAnimation();
    _navigateToHome();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.appLogo),
        const SizedBox(height: 5),
        SlidingText(slidingAnimation: _slidingAnimation)
      ],
    );
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: kSplashAnimationDurationWithMS),
    );
    _slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
  }

  void _navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAll(
          const HomeView(),
          transition: Transition.fade,
          duration: kTransitionDuration,
        );
      },
    );
  }
}
