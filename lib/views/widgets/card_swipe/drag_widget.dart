import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/profile.dart';
import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import 'profile_card.dart';
import 'tag_widget.dart';

class DragWidget extends StatelessWidget {
  const DragWidget({
    Key? key,
    required this.profile,
    required this.index,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);
  final Profile profile;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: swipeNotifier.value != Swipe.none
                    ? swipeNotifier.value == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    ProfileCard(profile: profile),
                    swipeNotifier.value != Swipe.none
                        ? swipeNotifier.value == Swipe.right
                            ? const Positioned.fill(
                                child: TagWidget(
                                  iconPath: "assets/icons/ic_like.svg",
                                  gradient: likeGradient,
                                ),
                              )
                            : const Positioned.fill(
                                child: TagWidget(
                                  iconPath: "assets/icons/ic_not_like.svg",
                                  gradient: dislikeGradient,
                                ),
                              )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx > Get.width / 2) {
            swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx < Get.width / 2) {
            swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          swipeNotifier.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        //This will be visible when we press action button
        child: ValueListenableBuilder(
          valueListenable: swipeNotifier,
          builder: (BuildContext context, Swipe swipe, Widget? child) {
            return Stack(
              children: [
                ProfileCard(profile: profile),
                // heck if this is the last card and Swipe is not equal to Swipe.none
                swipe != Swipe.none && isLastCard
                    ? swipe == Swipe.right
                        ? const Positioned.fill(
                            child: TagWidget(
                              iconPath: "assets/icons/ic_like.svg",
                              gradient: likeGradient,
                            ),
                          )
                        : const Positioned.fill(
                            child: TagWidget(
                              iconPath: "assets/icons/ic_not_like.svg",
                              gradient: dislikeGradient,
                            ),
                          )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
