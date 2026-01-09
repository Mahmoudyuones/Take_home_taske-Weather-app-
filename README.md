<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/a446468c-d47f-4bb1-9a31-589793b679da" />
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/7eff1b52-5ac1-4c8f-a9d0-b32c5ded366e" />
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/3648a4ba-7a08-4bea-9422-d48984264d18" />

🌤️ Weather App – Take Home Task

A clean-architecture Flutter Weather Application that allows users to:

View weather using current location

Search weather by city name

Manage favorite cities (add / remove)

This project follows Clean Architecture, Cubit (flutter_bloc), and GoRouter best practices.

📱 Features

📍 Current Location Weather

🔍 Search Weather by City Name

⭐ Add / Remove Favorite Cities

🧭 Clean navigation using GoRouter

🧠 State management using Cubit

🏗️ Clean Architecture (Data / Domain / Presentation)

🏛️ Architecture Overview

The project follows Clean Architecture principles:

lib/
├── core/
│   ├── constants/
│   ├── theme/
│   └── utils/
│
├── config/
│   ├── base_state/
│   └── router/
│
├── features/
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       └── home_view_model/
│   │
│   └── weather/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart
🧠 State Management

Cubit is used for state management

Each feature has its own ViewModel

State is wrapped using a reusable BaseState<T>

Example States:

Loading

Success

Error

⭐ Favorites Module

The Favorites feature supports:

Get favorite cities

Add city to favorites

Remove city from favorites

Favorites ViewModel (Simplified)

Uses only 3 use cases:

GetFavoritesUseCase

AddFavoriteUseCase

RemoveFavoriteUseCase

Automatically refreshes the favorites list after add/remove

🧭 Navigation (GoRouter)

Navigation is handled using GoRouter.

Key Points:

context.go() is used instead of push or pushReplacement

Weather screen uses a ValueKey(cityName) to force rebuild when city changes

WeatherScreen(
  key: ValueKey(cityName),
  cityName: cityName,
)

This ensures:

No stale data

No hot restart needed

Correct API re-fetching

🔌 Dependency Injection

Uses injectable for dependency injection

All ViewModels and UseCases are injected cleanly

🚀 Getting Started
1️⃣ Clone the repository
git clone <https://github.com/Mahmoudyuones/Take_home_taske-Weather-app-.gitl>
2️⃣ Install dependencies
flutter pub get
3️⃣ Run the app
flutter run
🧪 Notes

API errors are handled gracefully

UI reacts correctly to state changes

Code is structured for scalability and testing

👨‍💻 Author

Mahmoud Younes
Flutter Developer

✅ Task Status

✔ Clean Architecture applied
✔ State Management implemented
✔ Favorites feature working correctly
✔ Navigation issues resolved
✔ Ready for review 🚀
