# Burger Order App

A **Flutter** application that helps users easily order burgers. The app is designed with **Clean Architecture** principles, utilizing the **BLoC** pattern and **GetIt** for dependency injection to ensure maintainability, scalability, and testability.

## Features

- Browse a variety of burgers
- Customize orders with different ingredients and preferences
- Add items to the cart and place orders
- Intuitive and easy-to-use interface

## Technologies Used

- **Flutter** for cross-platform mobile app development
- **Dart** programming language
- **BLoC (Business Logic Component)** for state management
- **GetIt** for dependency injection
- **Clean Architecture** for structured, maintainable code

## Mockup
![burger](https://github.com/user-attachments/assets/138b3208-c4a0-45d3-84c1-0b5d1bf97eb9)


## Getting Started

### Prerequisites

- Ensure you have **Flutter** installed on your machine. You can download it from the official [Flutter website](https://flutter.dev/docs/get-started/install).
- Make sure you have an emulator or physical device set up for testing the application.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/resourceful-nebil/assessment.git
Navigate to the project directory:
bash
Always show details

Copy code
cd assessment
Install dependencies:
bash
Always show details

Copy code
flutter pub get
Run the app on an emulator or physical device:
bash
Always show details

Copy code
flutter run
Usage
Once the app is running, you can:

Browse the available burger options.
Customize your order by selecting ingredients.
Add items to your cart.
Proceed to checkout and place your order.
Project Structure
This project follows Clean Architecture, separating concerns into layers for better code organization and maintainability:

Presentation Layer: UI components and state management using BLoC.
Domain Layer: Business logic, entities, and use cases.
Data Layer: Data sources, repositories, and models.
Contributing
Contributions are welcome! If you want to contribute to the project, follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit (git commit -m 'Add new feature').
Push to the branch (git push origin feature-branch).
Open a Pull Request.
