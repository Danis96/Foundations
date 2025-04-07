# Foundations

Foundations is a Swift Package that provides a dependency injection container using the Factory pattern, along with common utilities for iOS applications. This package helps you manage dependencies efficiently while maintaining clean architecture principles.

## Features

- **Robust Dependency Injection Container**
  - Built using the Factory pattern
  - Type-safe dependency resolution
  - Automatic singleton management
  - Easy to extend with custom dependencies

- **Built-in Services**
  - `StorageManager`: Handles persistent storage operations
  - `ColorHelper`: Manages color-related utilities and theming

## Installation

### Swift Package Manager

Add this package to your project using Swift Package Manager:

#### Using Xcode
1. In Xcode, select File > Swift Packages > Add Package Dependency
2. Enter the repository URL
3. Choose the version you want to use

#### Using Package.swift
Add the following to your dependencies:

```swift
dependencies: [
    .package(url: "your-repository-url", from: "1.0.0")
]
```

## Detailed Usage Guide

### Setting Up the Container

```swift
import Foundations

// Access the shared container - thread-safe singleton
let foundations = Foundations.shared
```

### Using StorageManager

The StorageManager provides a clean interface for data persistence:

```swift
let storageManager = foundations.storageManager()

// Store data
storageManager.save(key: "userSettings", value: settings)

// Retrieve data
let settings = storageManager.retrieve(key: "userSettings")

// Remove data
storageManager.remove(key: "userSettings")
```

### Using ColorHelper

ColorHelper provides utilities for consistent color management across your app:

```swift
let colorHelper = foundations.colorHelper()

// Access theme colors
let primaryColor = colorHelper.primaryColor
let secondaryColor = colorHelper.secondaryColor

// Dynamic color support
let dynamicBackground = colorHelper.getDynamicColor(light: .white, dark: .black)
```

### Custom Dependency Registration

You can extend the container with your own dependencies:

```swift
public extension Foundations {
    var customService: Factory<CustomServiceProtocol> {
        self { CustomServiceImplementation() }
            .singleton
    }
}
```

## Architecture

The package follows these architectural principles:

- **Dependency Inversion**: Uses protocols for loose coupling
- **Singleton Management**: Handles shared resources efficiently
- **Thread Safety**: All services are thread-safe by default
- **Extensibility**: Easy to add new services and managers

## Best Practices

1. **Initialization**
   - Initialize the container early in your app lifecycle
   - Use dependency injection in your ViewModels/Controllers

2. **Service Access**
   - Always access services through the container
   - Avoid creating service instances directly

3. **Testing**
   - Use protocol-based interfaces for better testability
   - Mock dependencies easily through the container

## Requirements

- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[Your license information here]

## Contact

Danis Preldzic
2025

## Support

If you have any questions or need support, please:
1. Open an issue in the repository
2. Contact the package maintainers
3. Check the documentation for updates
