import 'package:flutter/material.dart';

enum TypeButton { raised, outline, flat }
enum StyleButton { matrial, custom }

class ButtonWidget extends StatelessWidget {
  /// Text Button
  final String text;

  /// action Tab button
  final Function onTab;

  /// type Button [Raised, Outline, Flat] default [TypeButton.raised]
  final TypeButton type;

  /// Ukuran Maxsimal tergantung pada ukuran lebar Device default [true]
  final bool expanded;

  /// margin Horizontal default [0]
  final double marginHorizontal;

  /// margin Vertucal default [+-16.0]
  final double marginVertical;

  /// opacity background button default [1]
  final double opacity;

  /// Icon Left button default [null]
  final Widget icon;

  /// Shadow style button default [false]
  final bool shadow;

  /// color Background button default [Theme.buttonColor] AND
  /// Text Color Button default if [Raised] ? [Colors.white] : [Theme.buttonColor]
  final Color color;

  /// border radius default [4.0]
  final double borderRadius;

  /// tinggi button default [40.0]
  final double height;

  /// loading indicator default [false]
  final bool loading;

  const ButtonWidget(
      {Key key,
      @required this.text,
      this.height = 40.0,
      this.expanded = true,
      this.marginVertical,
      this.icon,
      this.shadow = false,
      this.marginHorizontal = 0.0,
      this.type = TypeButton.raised,
      this.opacity,
      this.color,
      this.borderRadius = 4.0,
      this.loading = false,
      @required this.onTab})
      : assert(text != null);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Opacity(
      opacity: opacity ?? 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: height,
            width: expanded ? mediaQuery.width : null,
            margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal,
              vertical: marginVertical ??
                  (MediaQuery.of(context).padding.bottom) +
                      (16 - (MediaQuery.of(context).padding.bottom) / 2),
            ),
            decoration: type == TypeButton.raised
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    boxShadow: [
                        shadow
                            ? BoxShadow(
                                color: color == null
                                    ? Theme.of(context)
                                        .buttonColor
                                        .withOpacity(0.5)
                                    : color.withOpacity(0.5),
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4.0)
                            : BoxShadow()
                      ])
                : null,
            child: FlatButton(
              disabledColor:
                  loading ? Theme.of(context).buttonColor : Colors.grey[400],
              color: type == TypeButton.raised
                  ? color ?? Theme.of(context).buttonColor
                  : type == TypeButton.flat ? Colors.transparent : Colors.white,
              textColor: type == TypeButton.raised
                  ? Colors.white
                  : color ?? Theme.of(context).buttonColor,
              splashColor: type == TypeButton.raised
                  ? Colors.white.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3),
              highlightColor: type == TypeButton.raised
                  ? Colors.white.withOpacity(0.15)
                  : Colors.grey.withOpacity(0.15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  side: type == TypeButton.outline
                      ? BorderSide(
                          color: color ?? Theme.of(context).buttonColor,
                          width: 1.5,
                          style: BorderStyle.solid)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius)),
              child: buildContent(context),
              onPressed: loading ? null : onTab,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    if (!loading) {
      if (expanded) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Offstage(
              offstage: icon == null,
              child: Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text.toUpperCase(),
                style: Theme.of(context).textTheme.button.copyWith(
                    color: type == TypeButton.raised
                        ? Colors.white
                        : color ?? Theme.of(context).buttonColor),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        );
      } else {
        return Row(
          children: <Widget>[
            Offstage(
              offstage: icon == null,
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Padding(padding: EdgeInsets.only(right: 4.0), child: icon),
              ),
            ),
            Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.button.copyWith(
                  color: type == TypeButton.raised
                      ? Colors.white
                      : color ?? Theme.of(context).buttonColor),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        );
      }
    } else {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).buttonColor),
          backgroundColor: Colors.white,
          strokeWidth: 2.5,
        ),
      );
    }
  }
}
