import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'games/GameClass.dart';

void main() {
  final game = GameClass();
  runApp(
    const GameWidget<GameClass>.controlled(
      gameFactory: GameClass.new,
    ),
  );
}