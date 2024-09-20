import 'package:flutter/material.dart';
import '../description_widget.dart'; // Adjust the import as needed

class CombinedActionButtonWidget extends StatefulWidget {
  @override
  _CombinedActionButtonWidgetState createState() => _CombinedActionButtonWidgetState();
}

class _CombinedActionButtonWidgetState extends State<CombinedActionButtonWidget> with SingleTickerProviderStateMixin {
  bool _showHint = false;
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _iconRotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _iconRotationAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleHint() {
    setState(() {
      _showHint = !_showHint;
      if (_showHint) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _checkWord(BuildContext context) {
    if (_controller.text.toUpperCase() == 'GARDENIA') {
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DescriptionWidget(onThemeChange: (String ) {  },)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Невірно, повторіть спробу')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  // Access the current theme

    return Stack(
      children: [
        Positioned(
          bottom: 16,
          left: 16,
          child: FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Введіть слово',
                    style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
                  ),
                  content: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Введіть слово'),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'Перевірити',
                        style: theme.textTheme.titleMedium,
                      ),
                      onPressed: () {
                        _checkWord(context);
                      },
                    ),
                  ],
                );
              },
            ),
            child: Icon(
              Icons.lock_open,
              color: theme.iconTheme.color,  // Use theme's icon color
            ),
            tooltip: 'Введіть слово',
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: RotationTransition(
            turns: _iconRotationAnimation,
            child: FloatingActionButton(
              onPressed: _toggleHint,
              child: Icon(
                _showHint ? Icons.visibility_off : Icons.visibility,
                color: theme.iconTheme.color,  // Use theme's icon color
              ),
              tooltip: 'Show/Hide Hint',
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 16,
          right: 16,
          child: AnimatedOpacity(
            opacity: _showHint ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              'Використовуй метод шифрування походження якого з Римської імперії і названий в честь найвідомішого правителя Римської імперії',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
