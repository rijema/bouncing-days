import 'dart:ui';

import 'package:blocky/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart'

import 'package:blocky/src/widgets/blocky_game.dart';


class Bat extends PositionComponent with DragCallbacks,HasGameReference<BlockyGame>{
  Bat ({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super (anchor: Anchor.center, children:  [RectangleHitBox(),])


  final _paint = Paint()
  ..color =  ballColor
  ..style = PaintingStyle.fill,

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);

    canvas.drawRRect(RRect.fromRectAndRadius(Offset.zero , radius), _paint);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    // TODO: implement onDragUpdate
    super.onDragUpdate(event);

    position.x = (position.x + event.localDelta.x).clamp(0, game.width);
  }

  void moveBy (double dx) {
    add (MoveToEffect(Vector2((position.x + dx).clamp(0,game.width),(position.y + dy).clamp(0,game.width)), controller));
  }
}