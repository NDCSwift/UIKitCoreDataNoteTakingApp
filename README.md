# 📝 UIKit Core Data Note-Taking App

A UIKit note-taking app backed by Core Data — demonstrating how to create, read, update, and delete persistent notes using `NSManagedObject`, `NSFetchRequest`, and `NSFetchedResultsController`.

---

## 🤔 What this is

This project shows the standard UIKit + Core Data pattern for a notes app: defining an `NSManagedObject` entity, fetching records with `NSFetchRequest`, displaying them in a `UITableView` via `NSFetchedResultsController`, and performing CRUD operations through the `NSManagedObjectContext`. All layout is programmatic — no storyboards.

## ✅ Why you'd use it

- **NSManagedObject** — Core Data entity definition and attribute access
- **NSFetchRequest** — fetch, sort, and filter persisted records
- **NSFetchedResultsController** — automatically syncs Core Data changes to a UITableView
- **CRUD operations** — create, read, update, and delete notes with context save
- **No storyboard** — fully programmatic UIKit + Core Data integration

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/-K0Vk1-U4sA)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/UIKitCoreDataNoteTakingApp.git
cd UIKitCoreDataNoteTakingApp
```

### 2. Open in Xcode
- Double-click `NoteTakingApp.xcodeproj`

### 3. Set Your Development Team
In Xcode: **TARGET → Signing & Capabilities → Team**

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier (e.g., `com.yourname.NoteTakingApp`).

---

## 🛠️ Notes

- The Core Data model file is included — no additional setup required.
- If you see a code signing error, check that Team and Bundle ID are set.

## 📦 Requirements

- iOS 16+
- Xcode 15+
- Swift 5.9+

---

📺 [Watch the guide on YouTube](https://youtu.be/-K0Vk1-U4sA)
