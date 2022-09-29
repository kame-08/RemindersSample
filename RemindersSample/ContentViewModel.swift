//
//  ContentViewModel.swift
//  RemindersSample
//
//  Created by Ryo on 2022/09/28.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    enum EventStatus {
        case hoge
        case update
    }
    
    var eventManager: EventManager!
    @Published var eventStatus: EventStatus!
    init() {

        eventManager = EventManager {
           DispatchQueue.main.sync {
               self.eventStatus = .hoge
           }
       }
    }
    
    
    func update(){
        eventManager.update{
            DispatchQueue.main.sync {
                self.eventStatus = .update
            }
        }
        
    }
}
