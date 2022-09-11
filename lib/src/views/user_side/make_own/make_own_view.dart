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
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _rotateAnimationController;
  List<Animation> _animationList = <Animation>[];
  late BoxConstraints _pizzaConstraints;

  late Animation<double> rotateAnimation;


  setRotation(int degree){
    final angle = degree * 3.1415927 / 180;
    rotateAnimation = Tween<double>(begin: 0, end: angle).animate(_animationController);
  }

  void buildIngedientsAnimation() {
    _animationList.clear();
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.8, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.2, 0.8, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.4, 1.0, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.1, 0.7, curve: Curves.decelerate)));
    _animationList.add(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 1.0, curve: Curves.decelerate)));
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
    _rotateAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    setRotation(360);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rotateAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MakeOwnViewModel>.reactive(
        builder: (context, model, child) {
          Widget _child(){
            if (_animationList.isNotEmpty) {
              for (int i = 0; i < model.selectedIngrediants.length; i++) {
                MakeOwnIngrediant ingrediant = model.selectedIngrediants[i];
                for (int j = 0; j < ingrediant.positions.length; j++) {
                  final animation = _animationList[j];
                  final position = ingrediant.positions[j];
                  final positionX = position.dx;
                  final positionY = position.dy;
                  double fromX = 0.0, fromY = 0.0;
                  if (j < 1) {
                    fromX = -_pizzaConstraints.maxWidth * (1 - animation.value);
                  } else if (j < 2) {
                    fromX = _pizzaConstraints.maxWidth * (1 - animation.value);
                  } else if (j < 4) {
                    fromY = -_pizzaConstraints.maxHeight * (1 - animation.value);
                  } else {
                    fromY = _pizzaConstraints.maxHeight * (1 - animation.value);
                  }

                  if(animation.value > 0) {
                    model.elements.add(
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(
                              fromX + _pizzaConstraints.maxWidth * positionX,
                              fromY + _pizzaConstraints.maxHeight * positionY,
                            ),
                          child: Image.asset(
                            ingrediant.image,
                            height: 40,
                          )),
                    );
                  }else {
                    model.elements.add(
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(
                              _pizzaConstraints.maxWidth * positionX,
                              _pizzaConstraints.maxHeight * positionY,
                            ),
                          child: Image.asset(
                            ingrediant.image,
                            height: 40,
                          )),
                    );
                  }
                }
              }

              return Stack(
                children: model.elements,
              );
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
                    onProfileTap: () {
                      NavService.userCart();
                      _animationList.clear();
                      model.elements.clear();
                    },
                    onBackTap: () {
                      Navigator.pop(context);
                      _animationList.clear();
                      model.elements.clear();
                    },
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
                                  model.focuced.value = false;
                                  setState(() {
                                    model.selectedIngrediants.add(ingredient);
                                    model.price = model.price + 100;
                                  });
                                  buildIngedientsAnimation();
                                  _animationController.forward(from: 0.0);
                                  setRotation(360);
                                  _rotateAnimationController.forward(from: 0);
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
                                      return LayoutBuilder(
                                          builder: (context, constraint) {
                                            _pizzaConstraints = constraint;
                                            print(constraint);
                                            return ValueListenableBuilder<bool>(
                                                valueListenable: model.focuced,
                                                builder: (context, focused, _) {
                                                  return AnimatedBuilder(
                                                      animation: rotateAnimation,
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(Images.dish),
                                                          Padding(
                                                            padding: const EdgeInsets.all(10),
                                                            child: Image.asset(Images.pizza1),
                                                          ),
                                                        ],
                                                      ),
                                                      builder: (context, child) {
                                                        return Transform.rotate(
                                                          angle: rotateAnimation.value,
                                                          child: child,
                                                        );
                                                      }
                                                  );
                                                });
                                          }
                                      );
                                }),
                              ),
                              VerticalSpacing(15),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                transitionBuilder:
                                    (Widget child, Animation<double> animation) {
                                  return SlideTransition(
                                    child: child,
                                    position: Tween<Offset>(
                                        begin: Offset(0.0, -0.5),
                                        end: Offset(0.0, 0.0))
                                        .animate(animation),
                                  );
                                },
                                child: Text(
                                  "RS. ${model.price}",
                                  key: UniqueKey(),
                                  style: TextStyling.h2
                                      .copyWith(color: AppColors.primary),
                                ),
                              )
                            ],
                          ),
                        ),
                        _child(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.ingrediants.length,
                        itemBuilder: (context, index) {
                          Color color = AppColors.lightGrey;
                          for (MakeOwnIngrediant i
                          in model.selectedIngrediants) {
                            if (i.compare(model.ingrediants[index])) {
                              color = AppColors.primary.withOpacity(0.5);
                            }
                          }
                          return Center(
                            child: Draggable(
                              feedback: Center(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Image.asset(
                                    model.ingrediants[index].image,
                                    height: 70,
                                    width: 70,
                                  )),
                                ),
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
                                          color: color,
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
                            model.onAddInCart(context);
                            _animationList.clear();
                            model.elements.clear();
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
