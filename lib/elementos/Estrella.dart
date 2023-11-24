import 'package:flame/components.dart';
import 'package:prueba_juego/games/GameClass.dart';

class Estrella extends SpriteComponent with HasGameRef<GameClass>{

  Estrella ({required super.position, required super.size});

  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("star.png"));
    anchor = Anchor.center;
    return super.onLoad();
  }
}