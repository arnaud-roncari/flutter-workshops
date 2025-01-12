# Flutter Bloc Implementation Guide

This guide explains how to set up and use the `flutter_bloc` package in your Flutter project.

---

## Steps:

### Clean the Project

Remove all the default Flutter code from `main.dart`. Create a new `home_page.dart` file and replace its content with a basic `Scaffold`:

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```

Update your `main.dart` to use this page:

```dart
import 'package:flutter/material.dart';
import 'package:your_project/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
```

### Stop the Project and Install the `flutter_bloc` Package

Stop the project if it is running. Add the `flutter_bloc` package by running:

```bash
flutter pub add flutter_bloc
```

### Generate Bloc and Clean Code

Use your IDE's quick action to generate the Bloc files. The structure should look like this:

```
lib/
├── blocs/
│   ├── auth_bloc.dart
│   ├── auth_event.dart
│   └── auth_state.dart
```

Make sure your files looks like this:

**auth_event.dart:**

```dart
abstract class AuthEvent {}
```

**auth_state.dart:**

```dart
abstract class AuthState {}

class AuthInitial extends AuthState {}
```

**auth_bloc.dart:**

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {);
  }
}
```

### Declare Bloc with BlocProvider

Wrap your `HomePage` with a `BlocProvider` in `main.dart`:

```dart
import 'package:your_project/bloc/auth_bloc.dart';
import 'package:your_project/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
```

### Create a Login Page

Create a new `login_page.dart` file and add a simple login form. In this exemple, we'll just create the button :

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Login"),
        ),
      ),
    );
  }
}

```

### Add BlocConsumer

Wrap the `Scaffold` in the `LoginPage` with a `BlocConsumer` to listen to states:

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
            /// ...
        },
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
              },
              child: const Text("Login"),
            ),
          );
        },
      ),
    );
  }
}
```

#### Add an Event `OnLogin`

Define an event that takes an email and password as parameters:

```dart
class OnLogin extends AuthEvent {
  final String email;
  final String password;

  OnLogin(this.email, this.password);
}
```

#### Bind the Event to a Function

In your `AuthBloc`, handle the event and bind it to a function:

```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OnLogin>(onLogin);
  }

  void onLogin(OnLogin event, Emitter<AuthState> emit) {
    /// Do something ...
  }
}

```

#### Create States for UI Impact

Define states that can affect your UI:

```dart
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {}
```

#### Update Bloc with Emit

Use `emit` to update the state:

```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OnLogin>(onLogin);
  }

  void onLogin(OnLogin event, Emitter<AuthState> emit) {
    emit(LoginFailed());
  }
}
```

#### Trigger event

Use `context.read<my-bloc>().add(my-event());` to trigger an event :

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            print("Error !");
          }
        },
        builder: (context, state) {
          /// Update UI depending on state.
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(OnLogin(email: "my-email", password: "my-password"));
              },
              child: const Text("Login"),
            ),
          );
        },
      ),
    );
  }
}

```

- **Listener**: Perform one-time actions such as showing error messages or navigating to another page.
- **Builder**: Update the UI based on the current state, which may be rebuilt multiple times.

### Summary

- Use `BlocProvider` to declare your Bloc in `main.dart`.
- Use `BlocConsumer` to manage UI changes and perform actions based on states.
- Add `Events` and handle them in your Bloc to emit new `States`.
- Use `listener` for one-time actions (e.g., navigation or showing messages).
- Use `builder` for UI updates that depend on the current state.

---

### What's Next?

- Create a Cookie Clicker game based on this Figma mockup: [Cookie Clicker Figma Mockup](https://www.figma.com/proto/FvIHWXXIQe3N5mj1tXoNcS/Introduction-Flutter?page-id=0%3A1&node-id=66-4&t=pnaOUfPpjRtIznV6-1)
- Here are some ideas to enhance your Cookie Clicker game:

  - Add goals and rewards for additional progression.
  - Implement a prestige system with permanent bonuses.
  - Introduce automatic cookie-generating machines.
  - Include time-limited special events for bonus cookies.
  - Create daily missions with rewards.
  - Add temporary multipliers for boosts.
  - And more...

- Here are some app ideas to practice Flutter BLoC:
  - A to-do list app with task categorization and progress tracking.
  - A weather app with real-time updates and location-based data.
  - A workout tracker with exercise logs and progress charts.
  - A recipe app with ingredient-based search and shopping lists.
  - A movie discovery app with ratings, reviews, and recommendations.
  - And more...
