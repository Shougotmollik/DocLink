# 📱 DocLink — Doctor Appointment Booking App

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

**DocLink** is a mobile application built with **Flutter** that modernizes the healthcare appointment process.  
It allows patients to **search for doctors**, **view profiles**, and **book appointments instantly**, reducing wait times and improving accessibility.

---

## 📑 Table of Contents
1. [Features](#-features)
2. [Tech Stack](#-tech-stack)
3. [Target Users](#-target-users)
4. [Project Roadmap](#-project-roadmap)
5. [UI/UX Design](#-uiux-design)
6. [Installation](#-installation)
7. [Project Structure](#-project-structure)
8. [Firebase Setup](#-firebase-setup)
9. [Contributing](#-contributing)
10. [License](#-license)

---

## ✨ Features
- **🔐 Secure Authentication** — Sign in/sign up with Firebase Authentication.
- **🩺 Doctor Discovery** — Browse and filter by specialty, rating, and location.
- **👨‍⚕️ Doctor Profiles** — View experience, consultation fees, and images.
- **📅 Appointment Booking** — Book time slots with instant confirmation.
- **✅ Booking Summary** — See appointment details after booking.
- **🔔 Push Notifications** — Appointment reminders (Firebase Cloud Messaging).
- **📍 Google Maps Integration** *(optional)* — Get directions to clinics.
- **📜 Appointment History** *(future scope)* — Track past visits.

---

## 🛠 Tech Stack

| Component              | Technology |
|------------------------|------------|
| **Frontend**           | Flutter (Dart) |
| **State Management**   | GetX |
| **Authentication**     | Firebase Auth |
| **Database**           | Firebase Firestore |
| **Cloud Storage**      | Firebase Storage |
| **Push Notifications** | Firebase Cloud Messaging |
| **UI/UX Design**       | Figma |
| **Maps API** *(optional)* | Google Maps API |

---

## 👥 Target Users
- **General Patients** — Individuals seeking fast and reliable appointment booking.
- **Elderly Patients** — Accessible UI for easy use.
- **Clinics & Hospitals** *(future scope)* — Manage queues and bookings digitally.

---

## 📆 Project Roadmap

| Week | Milestone |
|------|-----------|
| 1 | Project setup, Figma UI finalization, Firebase integration |
| 2 | Login, sign-up, and home screen implementation |
| 3 | Doctor listing & profile screen |
| 4 | Appointment booking & success confirmation |
| 5 | Notifications & appointment history |
| 6 | Testing, bug fixing, documentation, and deployment |

---

## 🎨 UI/UX Design
Figma Prototype: [🔗 View Design](https://www.figma.com/design/I3MOl0fAx4SmJnAwhSRQoC/Doctor-Appointment-Case-Study--for-Final-Year-Project?node-id=3-3&p=f&t=dEBbL0sD0a1Cyy1R-0)

---

## 📦 Installation

```bash
# Clone the repository
git clone https://github.com/Shougotmollik/DocLink.git

# Navigate into the project folder
cd DocLink

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📂 Project Structure

```
DocLink/
│── android/               # Android native files
│── ios/                   # iOS native files
│── lib/                   # Flutter source code
│   ├── controllers/       # GetX controllers
│   ├── models/            # Data models
│   ├── services/          # Firebase & API services
│   ├── views/             # UI screens
│   ├── widgets/           # Reusable UI components
│   └── main.dart          # App entry point
│── pubspec.yaml           # Flutter dependencies
│── README.md              # Project documentation
```

---

## 🔥 Firebase Setup

1. Create a new project in **[Firebase Console](https://console.firebase.google.com/)**.
2. Enable **Authentication** → Email/Password method.
3. Set up **Cloud Firestore** with collections:
   - `doctors` — doctor profiles & specialties
   - `appointments` — booked appointment data
4. Enable **Firebase Storage** for profile images.
5. Download config files:
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
6. *(Optional)* Configure **Firebase Cloud Messaging** for push notifications.

---

## 🤝 Contributing

1. **Fork** the repository  
2. Create a **new branch** (`feature/your-feature`)  
3. **Commit** your changes  
4. **Push** to your fork  
5. Open a **Pull Request**

---

## 📜 License
This project is licensed under the [MIT License](LICENSE).

---

> 💡 *DocLink makes healthcare more accessible, one appointment at a time.*
