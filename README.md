# Flutter Buttons & Navigation (Zuppi)

A multi-screen Flutter app demonstrating Material 3 buttons and navigation
with `Navigator` and named routes.

## Screens
| Screen | Route | Reached by |
|---|---|---|
| Login | `/` | app start / Logout (`pushReplacementNamed`) |
| Register | `/register` | `pushNamed`, leaves with `pop` |
| Button Gallery | `/buttons` | Login (`pushReplacement`) |
| Profile | `/profile` | `Navigator.push` |
| Details | `/details` | `pushNamed` |
| Settings | `/settings` | `pushNamed` |
| Add Event | `/add` | FAB, `Navigator.push` (returns a result via `pop`) |

## Buttons used
ElevatedButton, FilledButton, FilledButton.tonal, OutlinedButton, TextButton,
IconButton (standard / filled / outlined / toggle), FloatingActionButton,
`.icon` buttons, and a custom gradient pill button.

## Navigation methods
- `Navigator.push()` - Gallery to Profile and Add
- `Navigator.pop()` - Back buttons on every secondary screen
- `Navigator.pushReplacement()` - Login to Gallery (no way back to Login)
- Named routes - `routes:` in `MaterialApp`, used with `pushNamed`

```
Login --pushReplacement--> Button Gallery --> Profile / Details / Settings / Add
                                 ^                         |
                                 +--------- pop -----------+
Logout --pushReplacementNamed--> Login
```

## Run
```bash
flutter pub get
flutter run
```

## Screenshots
<img width="1508" height="647" alt="image" src="https://github.com/user-attachments/assets/994a825e-f391-4032-a46d-638a6e38aa44" />
<img width="1517" height="710" alt="image" src="https://github.com/user-attachments/assets/e2dbac0e-bafa-4eda-a968-3700dd957a5e" />
<img width="1517" height="361" alt="image" src="https://github.com/user-attachments/assets/59562e55-3c3c-4643-a8e5-9ec7aad2ab42" />
<img width="1513" height="250" alt="image" src="https://github.com/user-attachments/assets/4854eea9-ae30-4fed-8934-ec266bbbcd50" />







