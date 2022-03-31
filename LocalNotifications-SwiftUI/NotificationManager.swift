//
//  NotificationManager.swift
//  notifications
//
//  Created by Kaan İzgi on 1.03.2022.
//

import Foundation
import UserNotifications


class NotificationManager {

    static let instance = NotificationManager()
    
    func requestAuthorization () {
        let options:UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { succes, error in
            if let error = error {
                print("error Requst")
            }else {
                print("Succes Requst")
            }
        }
    }
    
    func scheduleNotification(title:String,subtitle:String,date:Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1
        
        //time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        //date
        //var dateComponents = DateComponents()
        //dateComponents.hour = 20
        //dateComponents.minute = 11
        
        //DataPicker
        let dateComponents = Calendar.current.dateComponents([.hour,.minute,.calendar], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        print("Succes")
    }
    
    //Delete with ID
    /*func deleteNotification() {
     UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["32"])
     
     }
     */
}
