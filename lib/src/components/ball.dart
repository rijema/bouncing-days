import 'dart:ui';

import 'package:blocky/src/components/play_area.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:blocky/src/widgets/blocky_game.dart';

class Ball extends CircleComponent with CollisionCallbacks, HasGameReference<BlockyGame>{
  Ball({
    required this.velocity,
    required super.position,
    required double radius,
  }) : super (
    radius : radius,
    anchor: Anchor.center,
    paint: Paint()
    ..color = ballColor
    ..style = PaintingStyle.fill,
  );

  final Vector2 velocity;
  
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position += velocity * dt;
  }

@override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);

    if(other is PlayArea){
      if(intersectionPoints.first.y <= 0){
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.x <= 0){
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.x >= game.width) {
                velocity.x = -velocity.x;
      } 
      else if (intersectionPoints.first.y >= game.width) {
                velocity.y = -velocity.y;

      }
    }
  }
}