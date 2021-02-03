//
//  Task.swift
//  NightWatch
//
//  Created by Bannasarn Boonmee on 3/2/2564 BE.
//

import Foundation

//Lesson 5 การใช้ @State, @Binding
//struct Task {
//    let name: String
//    var isComplete: Bool
//}

//Lesson 6 Class
//Class ต้องใส่ ObservableObject ด้วย
//class Task: ObservableObject { //cmd + click แล้วเลือก Generate Memberwise Initialize
//    internal init(name: String, isComplete: Bool) {
//        self.name = name
//        self.isComplete = isComplete
//    }
//
//    let name: String
//    @Published var isComplete: Bool //ถ้าตัวแปรไหนจะมีการเปลี่ยนแปลง ให้ใส่ @Published เข้าไปข้างหน้า
//}

class Task: ObservableObject, Identifiable { //cmd + click แล้วเลือก Generate Memberwise Initialize
    internal init(name: String, isComplete: Bool) {
        self.id = UUID()
        self.name = name
        self.isComplete = isComplete
    }

    let id: UUID
    let name: String
    @Published var isComplete: Bool //ถ้าตัวแปรไหนจะมีการเปลี่ยนแปลง ให้ใส่ @Published เข้าไปข้างหน้า
}
