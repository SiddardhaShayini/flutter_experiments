import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ExperimentMenu()));

class ExperimentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Experiments')),
      body: ListView(
        children: [
          _menuItem(context, 'Install Flutter and Dart SDK', InstallFlutterDart()),
          _menuItem(context, 'Explore Flutter Widgets', ExploreWidgets()),
          _menuItem(context, 'Responsive UI Design', ResponsiveUIDesign()),
          _menuItem(context, 'Navigation', NavigationExample()),
          _menuItem(context, 'Stateful and Stateless Widgets', StateWidgetExample()),
          _menuItem(context, 'Custom Widgets', CustomWidgetExample()),
          _menuItem(context, 'Form Validation', FormValidationExample()),
          _menuItem(context, 'Animation Examples', AnimationExample()),
          _menuItem(context, 'Fetch Data', FetchDataExample()),
          _menuItem(context, 'Debugging', DebuggingExample()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}

// Experiment: Install Flutter and Dart SDK
class InstallFlutterDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Install Flutter and Dart SDK')),
      body: Center(child: Text('Flutter and Dart SDK installation instructions.')),
    );
  }
}

// Experiment: Explore Flutter Widgets
class ExploreWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore Flutter Widgets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a Text Widget'),
            Image.network('https://via.placeholder.com/150', height: 100, width: 100),
            Container(color: Colors.blue, height: 50, width: 100),
          ],
        ),
      ),
    );
  }
}

// Experiment: Responsive UI Design
class ResponsiveUIDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    String layout = screenWidth < 600
        ? 'Mobile Layout'
        : screenWidth < 1200
            ? 'Tablet Layout'
            : 'Desktop Layout';

    return Scaffold(
      appBar: AppBar(title: Text('Responsive UI Design')),
      body: Center(child: Text(layout)),
    );
  }
}

// Experiment: Navigation
class NavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SecondScreen()));
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

// Experiment: Stateful and Stateless Widgets
class StateWidgetExample extends StatefulWidget {
  @override
  _StateWidgetExampleState createState() => _StateWidgetExampleState();
}

class _StateWidgetExampleState extends State<StateWidgetExample> {
  String value = "Before Press";

  void changeValue() {
    setState(() {
      value = "After Press";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful and Stateless Widgets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            ElevatedButton(onPressed: changeValue, child: Text('Change Value')),
          ],
        ),
      ),
    );
  }
}

// Experiment: Custom Widgets
class CustomWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Widgets')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => print('Custom Button Pressed!'),
          icon: Icon(Icons.thumb_up),
          label: Text('Custom Button'),
        ),
      ),
    );
  }
}

// Experiment: Form Validation
class FormValidationExample extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Enter Name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter Age';
                  if (int.tryParse(value) == null) return 'Enter a valid number';
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form Submitted!')));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Experiment: Animation
class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: isExpanded ? 200 : 100,
          height: isExpanded ? 200 : 100,
          color: Colors.blue,
          child: ElevatedButton(
            onPressed: () => setState(() => isExpanded = !isExpanded),
            child: Text('Animate'),
          ),
        ),
      ),
    );
  }
}

// Experiment: Fetch Data
class FetchDataExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetch Data')),
      body: Center(child: Text('Fetching Data Example')),
    );
  }
}

// Experiment: Debugging
class DebuggingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Debugging Example')),
      body: Center(child: Text('Debugging Instructions Here')),
    );
  }
}
