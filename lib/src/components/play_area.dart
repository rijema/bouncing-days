import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:blocky/src/widgets/blocky_game.dart';

class PlayArea extends RectangleComponent with CollisionCallback, HasGameReference<BlockyGame> {
PlayArea() : super (
  paint: Paint()..color = gameColor,
  children:  [RectangleHitbox()],
);

@override 
}