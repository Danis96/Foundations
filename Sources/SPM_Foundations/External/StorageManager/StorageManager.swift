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

public protocol StorageManager {
    // Secure Storage
    func setSecureValue(_ value: String, forKey key: String) throws
    func getSecureValue(forKey key: String) throws -> String?
    func deleteSecureValue(forKey key: String) throws
    func deleteAllSecureValues() throws
    
    // UserDefaults Storage
    func setEmail(_ email: String)
    func getEmail() -> String?
    func setLanguage(_ language: String)
    func getLanguage() -> String
    
    // Notification Management
    func getScheduledNotifications() -> Set<String>
    func markNotificationAsScheduled(_ notificationId: String)
    func removeScheduledNotification(_ notificationId: String)
    func clearAllScheduledNotifications()
}
