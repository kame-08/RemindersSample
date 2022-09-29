//
//  EventManager.swift
//  RemindersSample
//
//  Created by Ryo on 2022/09/28.
//

import Foundation
import EventKit

//Appleドキュメント
//https://developer.apple.com/documentation/eventkit

class EventManager {
    var store = EKEventStore()
    var predicate: NSPredicate?
    var data : [EKReminder] = []
    
    init(store: EKEventStore = EKEventStore(), handler: @escaping ()->()) {
        self.store = store
        store.requestAccess(to: .reminder) { granted, error in
            // リクエストに対するレスポンスを処理する。
        }
        
        let predicate: NSPredicate? = store.predicateForReminders(in: [store.calendars(for: .reminder).first!])
        if let predicate {
            store.fetchReminders(matching: predicate) { reminders in
                self.data += reminders!
                handler()
            }
        }
    }
    
    func update(handler: @escaping ()->()) {
        var predicate: NSPredicate? = store.predicateForReminders(in: [store.calendars(for: .reminder).first!])
        if let aPredicate = predicate {
            //一回初期化ねー
            data = []
            store.fetchReminders(matching: predicate!) { reminders in
                self.data += reminders!
                print(reminders)
                handler()
            }
        }
        print("update")
    }
    
}
