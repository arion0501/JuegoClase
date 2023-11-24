import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../elementos/Estrella.dart';
import '../elementos/Gota.dart';
import '../players/PlayerClass.dart';

class GameClass extends FlameGame with HasKeyboardHandlerComponents {

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

    ObjectGroup? estrellas = mapComponent.tileMap.getLayer<ObjectGroup>("estrellas");

    for(final estrella in estrellas!.objects) {
      Estrella spriteStar = Estrella(position: Vector2(estrella.x, estrella.y), size: Vector2.all(64));
      add(spriteStar);
    }

    ObjectGroup? gotas = mapComponent.tileMap.getLayer<ObjectGroup>("gotas");

    for(final gota in gotas!.objects) {
      Gota spriteGota = Gota(position: Vector2(gota.x, gota.y), size: Vector2.all(64));
      add(spriteGota);
    }

    _ember = PlayerClass(
      position: Vector2(128, canvasSize.y - 150),
    );

    _ember2 = PlayerClass(
      position: Vector2(328, canvasSize.y - 150),
    );

    world.add(_ember);
    //world.add(_ember2);
  }
}