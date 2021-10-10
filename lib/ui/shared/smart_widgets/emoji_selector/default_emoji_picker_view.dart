import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zc_desktop_flutter/ui/shared/const_app_colors.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/category_emoji.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/config.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_picker.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_picker_builder.dart';
import 'package:zc_desktop_flutter/ui/shared/smart_widgets/emoji_selector/emoji_view_state.dart';

/// Default EmojiPicker Implementation
class DefaultEmojiPickerView extends EmojiPickerBuilder {
  /// Constructor
  DefaultEmojiPickerView(EmojiConfig config, EmojiViewState state)
      : super(config, state);

  @override
  _DefaultEmojiPickerViewState createState() => _DefaultEmojiPickerViewState();
}

class _DefaultEmojiPickerViewState extends State<DefaultEmojiPickerView>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  TabController? _tabController;
  bool hovering = false;
  String hoveredEmoji = '';
  String hoveredEmojiName = '';
  String currentCategory = 'RECENTS';

  @override
  void initState() {
    var initCategory = widget.state.categoryEmoji.indexWhere(
        (element) => element.category == widget.config.initCategory);
    if (initCategory == -1) {
      initCategory = 0;
    }
    _tabController = TabController(
        initialIndex: initCategory,
        length: widget.state.categoryEmoji.length,
        vsync: this);
    _pageController = PageController(initialPage: initCategory);
    super.initState();
  }

  Widget _buildBackspaceButton() {
    if (widget.state.onBackspacePressed != null) {
      return Material(
        type: MaterialType.transparency,
        child: IconButton(
            padding: const EdgeInsets.only(bottom: 2),
            icon: Icon(
              Icons.backspace,
              color: widget.config.backspaceColor,
            ),
            onPressed: () {
              widget.state.onBackspacePressed!();
            }),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final emojiSize = widget.config.getEmojiSize(constraints.maxWidth);

        return Container(
          decoration: BoxDecoration(
              color: widget.config.bgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: reactionBackground)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TabBar(
                      labelColor: widget.config.iconColorSelected,
                      indicatorColor: widget.config.indicatorColor,
                      unselectedLabelColor: widget.config.iconColor,
                      controller: _tabController,
                      labelPadding: EdgeInsets.zero,
                      onTap: (index) {
                        _pageController!.jumpToPage(index);
                        setState(() {
                          currentCategory = widget
                              .state.categoryEmoji[index].category
                              .toString();
                        });
                      },
                      tabs: widget.state.categoryEmoji
                          .asMap()
                          .entries
                          .map<Widget>((item) =>
                              _buildCategory(item.key, item.value.category))
                          .toList(),
                    ),
                  ),
                  _buildBackspaceButton(),
                ],
              ),
              Flexible(
                flex: 2,
                child: PageView.builder(
                  itemCount: widget.state.categoryEmoji.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _tabController!.animateTo(
                      index,
                      duration: widget.config.tabIndicatorAnimDuration,
                    );
                  },
                  itemBuilder: (context, index) =>
                      _buildPage(emojiSize, widget.state.categoryEmoji[index]),
                ),
              ),
              _buildHoverPreview()
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategory(int index, Category category) {
    return Tab(
      icon: Icon(
        widget.config.getIconForCategory(category),
        size: 15,
      ),
    );
  }

  Widget _buildButtonWidget({
    required VoidCallback onPressed,
    required VoidCallback onHover,
    required Widget child,
    required String emoji,
  }) {
    if (widget.config.buttonMode == ButtonMode.MATERIAL) {
      return MouseRegion(
          onHover: (v) {
            setState(() {
              hovering = true;
              onHover();
            });
          },
          onExit: (event) {
            setState(() {
              hovering = false;
            });
          },
          child: TextButton(
            onPressed: onPressed,
            child: child,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.all<Color>(
                  emoji == hoveredEmoji
                      ? emojiHoverRandomColor[
                              Random().nextInt(emojiHoverRandomColor.length)]
                          .withOpacity(0.3)
                      : Colors.transparent),
            ),
          ));
    }
    return CupertinoButton(
        padding: EdgeInsets.zero, onPressed: onPressed, child: child);
  }

  Widget _buildPage(double emojiSize, CategoryEmoji categoryEmoji) {
    // Display notice if recent has no entries yet
    if (categoryEmoji.category == Category.RECENT &&
        categoryEmoji.emoji.isEmpty) {
      return _buildNoRecent();
    }
    // Build page normally
    return GridView.count(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      padding: const EdgeInsets.all(0),
      crossAxisCount: widget.config.columns,
      mainAxisSpacing: widget.config.verticalSpacing,
      crossAxisSpacing: widget.config.horizontalSpacing,
      children: categoryEmoji.emoji
          .map<Widget>((item) => _buildEmoji(emojiSize, categoryEmoji, item))
          .toList(),
    );
  }

  Widget _buildEmoji(
    double emojiSize,
    CategoryEmoji categoryEmoji,
    Emoji emoji,
  ) {
    return _buildButtonWidget(
        onPressed: () {
          widget.state.onEmojiSelected(categoryEmoji.category, emoji);
        },
        onHover: () {
          hoveredEmoji = emoji.emoji;
          hoveredEmojiName = emoji.name;
          currentCategory = categoryEmoji.category.toString();
        },
        emoji: emoji.emoji,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            emoji.emoji,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: emojiSize,
              backgroundColor: Colors.transparent,
            ),
          ),
        ));
  }

  Widget _buildNoRecent() {
    return Center(
        child: Text(
      widget.config.noRecentsText,
      style: widget.config.noRecentsStyle,
      textAlign: TextAlign.center,
    ));
  }

  Widget _buildHoverPreview() {
    return Expanded(
      flex: hoveredEmoji == '' && hoveredEmojiName == '' ? 0 : 1,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(currentCategory.replaceAll('Category.', '')),
                  Container()
                ],
              ),
            ),
            hoveredEmojiName == '' ? SizedBox() : Divider(),
            hoveredEmoji == '' && hoveredEmojiName == ''
                ? SizedBox()
                : Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Text(
                            hoveredEmoji,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 40,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                hoveredEmojiName,
                                style: TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ':${hoveredEmojiName}:',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
