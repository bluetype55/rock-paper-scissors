const assetPath = 'assets/images';

enum InputType {
  rock,
  paper,
  scissors;

  String get path => '$assetPath/$name.png';
}
