import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../games/GameClass.dart';

class PlayerClass extends SpriteAnimationComponent
    with HasGameRef<GameClass>, KeyboardHandler{

  int horizontalDirection = 0;
  // Leyes de Newton: v = a * t
  // Leyes de Newton: d = v * t
  final Vector2 velocidad = Vector2.zero();
  final double aceleracion = 200;

  PlayerClass({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    //print("Teclado funcionando!!" + event.data.logicalKey.keyId.toString());
    /*if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      position.x += 20;
    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      position.x -= 20;
    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      position.y -= 20;
    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      position.y += 20;
    }*/
    horizontalDirection = 0;
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      horizontalDirection = 1;
    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      horizontalDirection = -1;
    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      position.y -= 20;
    }
    else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      position.y += 20;
    }
    else {
      horizontalDirection = 0;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    velocidad.x = horizontalDirection * aceleracion; // v = a * t
    position += velocidad * dt; // d = v * t
    super.update(dt);
  }

}