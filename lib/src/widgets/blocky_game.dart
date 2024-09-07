import 'dart:math' as math;
import 'dart:async';

import 'package:blocky/src/components/components.dart';
import 'package:blocky/src/config.dart';
import 'package:flame/game.dart';

class BlockyGame extends FlameGame {
  BlockyGame() : super (
    camera: CameraComponentwithFixedResolution(width: gameWidth,height:gameHeight)
  );

  double get width => size.x;
  double get height => size.y;

  final rand = math.Random();

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    camera.viewFinder.anchor = Anchor.topLeft;

    world.add(PlayArea());
    world.add(Ball(velocity: Vector2(rand.nextDouble()-0.5*width,height*0.2).normalized()..scale(height/4), position: size/2, radius: ballRadius));
  }

  debugMode = true;
}