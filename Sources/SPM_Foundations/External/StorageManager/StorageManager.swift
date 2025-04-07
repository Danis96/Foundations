//
//  StorageManager.swift
//  SPM_Foundations
//
//  Created by Danis Preldzic on 7. 4. 2025..
//

import Foundation
import Security

enum StorageError: Error {
    case saveError
    case readError
    case deleteError
    case invalidData
}

final class StorageManager {
    @MainActor static let shared = StorageManager()
    
    // MARK: - Constants
    private struct StorageKeys {
        static let userData = "userData"
        static let accessToken = "accessToken"
        static let notificationToken = "notificationToken"
        static let themePreference = "themePreference"
        static let firstRun = "firstRun"
        static let notificationPermissionStatus = "notificationPermissionStatus"
        static let email = "email"
        static let languageCode = "languageCode"
        static let scheduledNotifications = "scheduledNotifications"
        static let permissionsFinished = "permissionsFinished"
    }
    
    private let keychainService = "com.your.app.service"
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    // MARK: - Secure Storage (Keychain)
    func setSecureValue(_ value: String, forKey key: String) throws {
        guard let data = value.data(using: .utf8) else {
            throw StorageError.invalidData
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            // Item already exists, update it
            let updateQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: keychainService,
                kSecAttrAccount as String: key
            ]
            
            let attributes: [String: Any] = [
                kSecValueData as String: data
            ]
            
            let updateStatus = SecItemUpdate(updateQuery as CFDictionary, attributes as CFDictionary)
            guard updateStatus == errSecSuccess else {
                throw StorageError.saveError
            }
        } else if status != errSecSuccess {
            throw StorageError.saveError
        }
    }
    
    func getSecureValue(forKey key: String) throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecItemNotFound {
            return nil
        }
        
        guard status == errSecSuccess,
              let data = result as? Data,
              let string = String(data: data, encoding: .utf8) else {
            throw StorageError.readError
        }
        
        return string
    }
    
    func deleteSecureValue(forKey key: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw StorageError.deleteError
        }
    }
    
    func deleteAllSecureValues() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: keychainService
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw StorageError.deleteError
        }
    }
    
    // MARK: - UserDefaults Storage
    func setEmail(_ email: String) {
        defaults.set(email, forKey: StorageKeys.email)
    }
    
    func getEmail() -> String? {
        defaults.string(forKey: StorageKeys.email)
    }
    
    func setLanguage(_ language: String) {
        let validLanguages = ["en", "bs"]
        let languageToSet = validLanguages.contains(language) ? language : "en"
        defaults.set(languageToSet, forKey: StorageKeys.languageCode)
    }
    
    func getLanguage() -> String {
        defaults.string(forKey: StorageKeys.languageCode) ?? "en"
    }
    
    // MARK: - Notification Management
    func getScheduledNotifications() -> Set<String> {
        guard let data = defaults.string(forKey: StorageKeys.scheduledNotifications),
              let notifications = try? JSONDecoder().decode(Set<String>.self, from: Data(data.utf8)) else {
            return []
        }
        return notifications
    }
    
    func markNotificationAsScheduled(_ notificationId: String) {
        var notifications = getScheduledNotifications()
        notifications.insert(notificationId)
        if let encoded = try? JSONEncoder().encode(notifications),
           let jsonString = String(data: encoded, encoding: .utf8) {
            defaults.set(jsonString, forKey: StorageKeys.scheduledNotifications)
        }
    }
    
    func removeScheduledNotification(_ notificationId: String) {
        var notifications = getScheduledNotifications()
        notifications.remove(notificationId)
        if let encoded = try? JSONEncoder().encode(notifications),
           let jsonString = String(data: encoded, encoding: .utf8) {
            defaults.set(jsonString, forKey: StorageKeys.scheduledNotifications)
        }
    }
    
    func clearAllScheduledNotifications() {
        defaults.removeObject(forKey: StorageKeys.scheduledNotifications)
    }
    
    // MARK: - Permission Management
    func setNotificationPermissionStatus(_ granted: Bool) {
        defaults.set(granted, forKey: StorageKeys.notificationPermissionStatus)
    }
    
    func getNotificationPermissionStatus() -> Bool {
        defaults.bool(forKey: StorageKeys.notificationPermissionStatus)
    }
    
    func setPermissionsShownOnce() {
        defaults.set(true, forKey: StorageKeys.permissionsFinished)
    }
    
    func werePermissionsShownOnce() -> Bool {
        defaults.bool(forKey: StorageKeys.permissionsFinished)
    }
    
    func setPermissionKeyShownOnce(_ key: String, value: Bool) {
        defaults.set(value, forKey: key)
    }
    
    func removePermissionKey(_ key: String) {
        defaults.removeObject(forKey: key)
    }
    
    func getPermissionKeyStatus(_ key: String) -> Bool {
        defaults.bool(forKey: key)
    }
}
