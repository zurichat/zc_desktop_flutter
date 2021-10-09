

import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/category_emoji.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_picker.dart';

/// State that holds current emoji data
class EmojiViewState {
  /// Constructor
  EmojiViewState(
    this.categoryEmoji,
    this.onEmojiSelected,
    this.onBackspacePressed,
  );

  /// List of all category including their emoji
  final List<CategoryEmoji> categoryEmoji;

  /// Callback when pressed on emoji
  final OnEmojiSelected onEmojiSelected;

  /// Callback when pressed on backspace
  final OnBackspacePressed? onBackspacePressed;
}

