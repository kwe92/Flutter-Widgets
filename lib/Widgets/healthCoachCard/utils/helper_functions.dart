// !! add
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

// !! add
enum CharacterLengthCutOffType {
  clip,
  ellipsis,
}
