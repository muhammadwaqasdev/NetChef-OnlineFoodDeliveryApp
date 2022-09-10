import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_chef/generated/images.asset.dart';
import 'package:net_chef/src/base/utils/utils.dart';
import 'package:net_chef/src/models/make_own_ingrediant.dart';
import 'package:net_chef/src/services/local/navigation_service.dart';
import 'package:net_chef/src/shared/app_screen.dart';
import 'package:net_chef/src/shared/buttons.dart';
import 'package:net_chef/src/shared/spacing.dart';
import 'package:net_chef/src/shared/user/user_app_bar.dart';
import 'package:net_chef/src/styles/app_colors.dart';
import 'package:net_chef/src/styles/text_theme.dart';
import 'package:net_chef/src/views/user_side/make_own/make_own_view_model.dart';
import 'package:stacked/stacked.dart';

class MakeOwnView extends StatefulWidget {
  @override
  State<MakeOwnView> createState() => _MakeOwnViewState();
}

class _MakeOwnViewState extends State<MakeOwnView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Animation> _animationList = <Animation>[];
  double pizzaWidth = 0.0;

  void buildIngedientsAnimation() {
    _animationList.clear();
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.8, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 1.0, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 0.4, curve: Curves.decelerate)));
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MakeOwnViewModel>.reactive(
        builder: (context, model, child) {
          child(){
            if (_animationList.isNotEmpty) {
              for (int i = 0; i < model.selectedIngrediants.length; i++) {
                MakeOwnIngrediant ingrediant = model.selectedIngrediants[i];
                for (int j = 0; j < ingrediant.positions.length; j++) {
                  final animation = _animationList[j];
                  final position = ingrediant.positions[j];
                  final positionX = position.dx;
                  final positionY = position.dy;
                  double fromX = 0.0, fromY = 0.0;
                  pizzaWidth = context.screenSize().width ;
                  if (j < 1) {
                    fromX = -context.screenSize().width * (1 - animation.value);
                  } else if (j < 2) {
                    fromX = context.screenSize().width * (1 - animation.value);
                  } else if (j < 4) {
                    fromY = -context.screenSize().height * (1 - animation.value);
                  } else {
                    fromY = context.screenSize().height * (1 - animation.value);
                  }

                  model.elements.add(
                    Transform(
                        transform: Matrix4.identity()
                          ..translate(
                            fromX + context.screenSize().width * positionX,
                            fromY + context.screenSize().height / 2 * positionY,
                          ),
                        child: Image.asset(
                          ingrediant.image,
                          height: 40,
                        )),
                  );
                  return Stack(
                    children: model.elements,
                  );
                }
              }
            }
            return SizedBox.fromSize();
          }
          return AppScreen(
              isPrimary: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserSecondaryAppBar(
                    isCart: false,
                    title: "",
                    cartCount: model.cartService.totalQuantity,
                    onProfileTap: () => NavService.userCart(),
                    onBackTap: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    height: context.screenSize().height / 2,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Expanded(
                                child: DragTarget<MakeOwnIngrediant>(
                                    onAccept: (ingredient) {
                                  model.selectedIngrediants.add(ingredient);
                                  model.focuced.value = false;
                                  model.notifyListeners();
                                  buildIngedientsAnimation();
                                  _animationController.forward(from: 0.0);
                                }, onWillAccept: (ingredient) {
                                  print("onWillAccept");
                                  print(ingredient?.name);
                                  model.focuced.value = true;
                                  model.notifyListeners();
                                  for (MakeOwnIngrediant i
                                      in model.selectedIngrediants) {
                                    if (i.compare(ingredient!)) {
                                      return false;
                                    }
                                  }
                                  return true;
                                }, onLeave: (ingredient) {
                                  print("onLeave");
                                  print(ingredient?.name);
                                  model.focuced.value = false;
                                  model.notifyListeners();
                                }, builder: (context, list, reject) {
                                  return ValueListenableBuilder<bool>(
                                      valueListenable: model.focuced,
                                      builder: (context, focused, _) {
                                        return Stack(
                                          children: [
                                            Image.asset(Images.dish),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(Images.pizza1),
                                            ),
                                          ],
                                        );
                                      });
                                }),
                              ),
                              VerticalSpacing(15),
                              Text(
                                "\$15",
                                style: TextStyling.h2
                                    .copyWith(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, _) {
                            return child();
                          }
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.ingrediants.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Draggable(
                              feedback: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset(
                                  model.ingrediants[index].image,
                                  height: 70,
                                  width: 70,
                                )),
                              ),
                              data: model.ingrediants[index],
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, left: 8),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 56,
                                      width: 56,
                                      decoration: BoxDecoration(
                                          color: AppColors.primary
                                              .withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Image.asset(
                                        model.ingrediants[index].image,
                                        height: 36,
                                        width: 36,
                                      )),
                                    ),
                                    Text(
                                      model.ingrediants[index].name,
                                      style: TextStyling.h4
                                          .copyWith(color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MainButton(
                          title: "Add to Bucket",
                          onTap: () {
                            model.onAddInCart();
                          },
                          isBusy: model.isBusy,
                        )),
                  ),
                ],
              ));
        },
        viewModelBuilder: () => MakeOwnViewModel(),
        onModelReady: (model) => model.init());
  }
}
