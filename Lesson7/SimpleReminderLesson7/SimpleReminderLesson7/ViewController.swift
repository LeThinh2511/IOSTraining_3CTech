//
//  ViewController.swift
//  SimpleReminderLesson7
//
//  Created by ThinhLe on 8/3/18.
//  Copyright © 2018 ThinhLe. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Lunch time!"
        notificationContent.subtitle = "it's 12 o'clock!"
        notificationContent.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)

        
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
                                                title: "Delete", options: [.destructive])
        
        
        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        notificationContent.categoryIdentifier = "UYLReminderCategory"
        let request = UNNotificationRequest(identifier: "UYLLocalNotification", content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error ?? "no problem")
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
        print("presenting alert!")
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "Snooze":
            print("snooze action was chose!")
        default:
            print("no action")
        }
    }

}

