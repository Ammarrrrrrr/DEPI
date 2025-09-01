#FIGMA
https://www.figma.com/design/J4DGQTFAJOcNu90vpa91wY/E-Commerce-Mobile-App-UI-Kit--Community---1-?node-id=0-1&t=Z6cGcVIZLRgqeVAs-1

# Flutter Screen Snippets

## Snippets Setup (Android Studio)

1. Go to **File → Settings → Editor → Live Templates**
2. Add new template under **Dart**
3. Use abbreviation (e.g., `stless`, `stfull`)
4. Set **Applicable in: Dart**
5. For `$CLASS_NAME$` → Expression: `className()`

---

## Snippets

### Stateless Screen (`stless`)
```dart
import "package:flutter/material.dart";

class $CLASS_NAME$ extends StatelessWidget {
  const $CLASS_NAME$({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("$CLASS_NAME$")),
      body: const Center(
        child: Text("$CLASS_NAME$ Screen"),
      ),
    );
  }
}
```

### Stateful Screen (`stfull`)
```dart
import "package:flutter/material.dart";

class $CLASS_NAME$ extends StatefulWidget {
  const $CLASS_NAME$({super.key});

  @override
  State<$CLASS_NAME$> createState() => _$CLASS_NAME$State();
}

class _$CLASS_NAME$State extends State<$CLASS_NAME$> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("$CLASS_NAME$")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $counter"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => counter++),
              child: const Text("Increase"),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Tips
- Use **`stless`** when no UI changes are needed
- Use **`stfull`** when the screen must update dynamically

