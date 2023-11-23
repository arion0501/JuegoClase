import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../players/PlayerClass.dart';

class GameClass extends FlameGame {

  GameClass();

  @override
  final world = World();
  late final CameraComponent cameraComponent;
  late PlayerClass _ember, _ember2;
  late TiledComponent mapComponent;

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'ember.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
      'mapa1.png',
      'mapa2.png'
    ]);

    cameraComponent = CameraComponent(world: world);
    // Everything in this tutorial assumes that the position
    // of the `CameraComponent`s viewfinder (where the camera is looking)
    // is in the top left corner, that's why we set the anchor here.
    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    addAll([cameraComponent, world]);

    mapComponent = await TiledComponent.load('mapa1.tmx', Vector2.all(32));
    world.add(mapComponent);

    _ember = PlayerClass(
      position: Vector2(128, canvasSize.y - 70),
    );

    _ember2 = PlayerClass(
      position: Vector2(328, canvasSize.y - 70),
    );

    world.add(_ember);
    world.add(_ember2);
  }
}