import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker/talker.dart';
import 'package:twelve_notes/src/presentation/widgets/carousel/carousel_cubit.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

import 'package:twelve_notes/src/theme/twelve_colors.dart';

class CarouselWidget extends StatelessWidget {
  final List<Widget> views;
  final bool autoAnimation;

  const CarouselWidget({
    super.key,
    required this.views,
    this.autoAnimation = true,
  });

  static const animationDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) => BlocProvider<CarouselCubit>(
        create: (context) => CarouselCubit(
          talker: context.read<Talker>(),
          totalPage: views.length,
          autoAnimation: autoAnimation,
        ),
        child: BlocConsumer<CarouselCubit, int>(
          listener: (BuildContext context, int page) {
            context.read<CarouselCubit>().pageController.animateToPage(
                  page,
                  duration: animationDuration,
                  curve: Curves.easeIn,
                );
          },
          builder: (context, page) => Container(
            constraints: const BoxConstraints(
              minHeight: 400.0,
              minWidth: 250.0,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 300.0,
                  child: PageView.builder(
                    controller: context.read<CarouselCubit>().pageController,
                    onPageChanged: context.read<CarouselCubit>().onPageChanged,
                    physics: autoAnimation ? const NeverScrollableScrollPhysics() : null,
                    itemCount: views.length,
                    itemBuilder: (context, index) => views[index],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 8.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: views.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 16.0),
                        itemBuilder: (context, index) => index == page
                            ? const _SelectedDot(
                                duration: animationDuration,
                              )
                            : const _CircleDot(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _CircleDot extends StatelessWidget {
  const _CircleDot();

  @override
  Widget build(BuildContext context) => Container(
        width: 12.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: TwelveColors.surfaceDark.withAlpha(150),
        ),
      );
}

class _SelectedDot extends StatefulWidget {
  final Duration duration;

  const _SelectedDot({
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<_SelectedDot> createState() => __SelectedDotState();
}

class __SelectedDotState extends State<_SelectedDot> {
  @override
  Widget build(BuildContext context) => Container(
        width: 24.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: context.colorScheme.primary,
        ),
      );
}
