import 'package:flutter/material.dart';

class JsonBuilder extends StatelessWidget {
  final Map json;
  final Map<String, VoidCallback>? onPressActions;

  const JsonBuilder({super.key, required this.json, this.onPressActions});

  @override
  Widget build(BuildContext context) {
    final List components = json['components'];
    final appBarStyle = json['appBarStyle'] ?? {};
    final titleStyle = appBarStyle['titleStyle'] ?? {};
    final alignment = json['alignment'] == "center"
        ? MainAxisAlignment.center
        : MainAxisAlignment.start;
    final Widget mainBody = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: alignment,
        children: components.map<Widget>((component) {
          return buildWidgetFromJson(component);
        }).toList(),
      ),
    );
    return Scaffold(
      backgroundColor: _hexToColor(json['backgroundColor'], Colors.grey),
      appBar: AppBar(
        backgroundColor: _hexToColor(appBarStyle['backgroundColor'], Colors.grey),
        title: Text(
          json['title'],
          style: TextStyle(
            color: _hexToColor(titleStyle['color'], Colors.white),
            fontSize: _toDouble(titleStyle['fontSize'], 20.0),
            fontWeight: titleStyle['fontWeight'] == 'bold'
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: alignment== MainAxisAlignment.center? Center(child: mainBody): mainBody,
      ),
    );
  }
  Widget buildWidgetFromJson(Map<String, dynamic> component) {
    switch (component['type']) {
      case 'Image':
        return Padding(
          padding: _getEdgeInsets(component['style']?['margin']),
          child: Image.asset(component['value'], height: _toDouble(component['style']?['height']),),
        );
      case 'Text':
        return Padding(
          padding: _getEdgeInsets(component['style']?['margin']),
          child: Text(
            component['value'],
            textAlign: _getTextAlign(component['style']?['textAlign']),
            style: _getTextStyle(component['style']),
          ),
        );
      case 'TextField':
        return Padding(
          padding: _getEdgeInsets(component['style']?['margin']),
          child: TextField(
            decoration: InputDecoration(
              hintText: component['placeholder'],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    _toDouble(component['style']?['borderRadius'], 4.0)),
                borderSide: BorderSide(
                  color: _hexToColor(
                      component['style']?['borderColor'], Colors.grey),
                  width: _toDouble(component['style']?['borderWidth'], 1.0),
                ),
              ),
              contentPadding:
              _getEdgeInsets(component['style']?['padding']),
            ),
            obscureText: component['obscureText'] ?? false,
            style: TextStyle(
              color: _hexToColor(component['style']?['textColor'], Colors.black),
              fontSize: _toDouble(component['style']?['fontSize'], 14.0),
            ),
          ),
        );
      case 'Button':
        return Padding(
          padding: _getEdgeInsets(component['style']?['margin']),
          child: SizedBox(
            width: _toDouble(component['style']?['width'], double.infinity),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _hexToColor(
                    component['style']?['backgroundColor'], Colors.blue),
                padding: _getEdgeInsets(component['style']?['padding']),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      _toDouble(component['style']?['borderRadius'], 4.0)),
                ),
              ),
              onPressed: () {
                final action = component['onPress'];
                if (onPressActions != null && onPressActions!.containsKey(action)) {
                  onPressActions![action]!(); // Call the respective callback
                } else {
                  print('No action defined for $action');
                }
              },
              child: Text(
                component['label'],
                style: TextStyle(
                  color: _hexToColor(component['style']?['textColor'], Colors.white),
                  fontSize: _toDouble(component['style']?['fontSize'], 16.0),
                ),
              ),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // Helper Functions
  double _toDouble(dynamic value, [double defaultValue = 0.0]) {
    if (value is int) return value.toDouble();
    if (value is double) return value;
    return defaultValue;
  }

  Color _hexToColor(String? hexColor, [Color fallbackColor = Colors.black]) {
    if (hexColor == null || hexColor.isEmpty) {
      return fallbackColor;
    }

    try {
      final buffer = StringBuffer();
      // Ensure the hex color starts with "ff" if it's a shorthand (6 or 7 characters long).
      if (hexColor.startsWith('#')) {
        hexColor = hexColor.substring(1);
      }

      if (hexColor.length == 6) {
        buffer.write('ff');
      } else if (hexColor.length != 8) {
        // If not 6 or 8 characters long, return fallback color.
        return fallbackColor;
      }

      buffer.write(hexColor);
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      // Return fallback color in case of an error.
      return fallbackColor;
    }
  }

  TextAlign _getTextAlign(String? textAlign) {
    switch (textAlign) {
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      case 'left':
      default:
        return TextAlign.left;
    }
  }

  TextStyle _getTextStyle(Map<String, dynamic>? style) {
    if (style == null) return const TextStyle();
    return TextStyle(
      fontSize: _toDouble(style['fontSize'], 14.0),
      fontWeight: style['fontWeight'] == 'bold'
          ? FontWeight.bold
          : FontWeight.normal,
      color: _hexToColor(style['color'], Colors.black),
    );
  }

  EdgeInsets _getEdgeInsets(Map<String, dynamic>? padding) {
    if (padding == null) return EdgeInsets.zero;
    return EdgeInsets.only(
      top: _toDouble(padding['top'], 0.0),
      bottom: _toDouble(padding['bottom'], 0.0),
      left: _toDouble(padding['left'], 0.0),
      right: _toDouble(padding['right'], 0.0),
    );
  }
}
