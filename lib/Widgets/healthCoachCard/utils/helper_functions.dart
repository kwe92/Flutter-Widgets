// ?? DONE
String maxCharacterLengthCutOff(
  String text,
  int maxLength, [
  CharacterLengthCutOffType cutOffType = CharacterLengthCutOffType.ellipsis,
]) =>
    text.length > maxLength
        ? switch (cutOffType) {
            CharacterLengthCutOffType.ellipsis => '${text.substring(0, maxLength)}...',
            CharacterLengthCutOffType.clip => text.substring(0, maxLength),
          }
        : text;

enum CharacterLengthCutOffType {
  clip,
  ellipsis,
}
