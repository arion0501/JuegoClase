import 'package:flame/components.dart';
import 'package:prueba_juego/games/GameClass.dart';
import 'package:prueba_juego/players/PlayerClass.dart';

class Gota extends SpriteAnimationComponent with HasGameRef<GameClass> {

  Gota({
    required super.position, required super.size
}) :  super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('water_enemy.png'),
      SpriteAnimationData.sequenced(
        amount: 2,
        amountPerRow: 2,
        textureSize: Vector2(16, 16),
        stepTime: 0.12,
      ),
    );
  }
 }