//
//  ContentView.swift
//  NightWatch
//
//  Created by Bannasarn Boonmee on 1/2/2564 BE.
//

import SwiftUI

//Lesson 8 Data Model
struct ContentView: View {
    
    @ObservedObject var nightWatchTask: NightWatchTask
    @State private var isFocusMode = false
    @State private var isResetAlert = false
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: HStack {
                    Text(Image(systemName: "moon.stars")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
                    Text("Nightly Tasks").font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }) {
                    ForEach(nightWatchTask.nightlyTasks) { (task) in
                        if !isFocusMode || (isFocusMode && !task.isComplete) {
                            NavigationLink(
                                destination: DetailView(task: task),
                                label: {
                                    TaskRowView(task: task)
                                })
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTask.nightlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightWatchTask.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: HStack {
                    Text(Image(systemName: "sunset")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
                    Text("Weekly Tasks").font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }) {
                    ForEach(nightWatchTask.weeklyTasks) { (task) in
                        if !isFocusMode || (isFocusMode && !task.isComplete) {
                            NavigationLink(
                                destination: DetailView(task: task),
                                label: {
                                    TaskRowView(task: task)
                                })
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTask.weeklyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightWatchTask.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
                Section(header: HStack {
                    Text(Image(systemName: "calendar")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
                    Text("Monthly Tasks").font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }) {
                    ForEach(nightWatchTask.monthlyTasks) { (task) in
                        if !isFocusMode || (isFocusMode && !task.isComplete) {
                            NavigationLink(
                                destination: DetailView(task: task),
                                label: {
                                    TaskRowView(task: task)
                                })
                        }
                    }.onDelete(perform: { indexSet in
                        nightWatchTask.monthlyTasks.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightWatchTask.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
            }.listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Toggle("Focus Mode", isOn: $isFocusMode)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Reset"){
                        isResetAlert = true
                    }
                }
            }
        }
        .alert(isPresented: $isResetAlert ) {
            Alert(title: Text("Reset List"),
                  message: Text("Are you sure?"),
                  primaryButton: .cancel(),
                  secondaryButton: .destructive(Text("Yes"), action: {
                    let newTasks = NightWatchTask()
                    nightWatchTask.nightlyTasks = newTasks.nightlyTasks
                    nightWatchTask.weeklyTasks = newTasks.weeklyTasks
                    nightWatchTask.monthlyTasks = newTasks.monthlyTasks
                  }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTask = NightWatchTask()
        ContentView(nightWatchTask: nightWatchTask)
    }
}

//Lesson 7 @EnvironmentObject พังอยู่ฟังไม่ทัน
//let nightlyTasks = [Task(name: "Check all windows", isComplete: false),
//                    Task(name: "Check all doors", isComplete: false),
//                    Task(name: "Check that the safe is locked", isComplete: false),
//                    Task(name: "Check the mailbox", isComplete: false),
//                    Task(name: "Inspect security cameras", isComplete: false),
//                    Task(name: "Clear ice from sidewalks", isComplete: false),
//                    Task(name: "Document strange and unusual occurrences", isComplete: false)]
//
//struct ContentView: View {
//
//    //@EnvironmentObject คือตัวต้นน้ำ
//    @EnvironmentObject var task = Task
//
//
//    var body: some View {
//
//        VStack {
//            HStack {
//                Image(systemName: task.isComplete ? "checkmark.square" : "square")
//                Text(task.name)
//            }
//            //Extract Subview
//            ControlView(task: task) //ไม่ต้องใส่ $ เหมือน Stuct แล้ว
//        }
//
//    }
//}
//
//struct ControlView: View {
//
//    @EnvironmentObject var task = Task
//
//    var body: some View {
//        Button(task.isComplete ? "Reset" : "Mark Complete") {
//            task.isComplete = !task.isComplete
//        }.padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let task = Task(name: "Check all windows", isComplete: false)
//        ContentView().environment(task)
//    }
//}

//Lesson 6 การใช้ @StateObject, @ObservedObject
//let nightlyTasks = [Task(name: "Check all windows", isComplete: false),
//                    Task(name: "Check all doors", isComplete: false),
//                    Task(name: "Check that the safe is locked", isComplete: false),
//                    Task(name: "Check the mailbox", isComplete: false),
//                    Task(name: "Inspect security cameras", isComplete: false),
//                    Task(name: "Clear ice from sidewalks", isComplete: false),
//                    Task(name: "Document strange and unusual occurrences", isComplete: false)]
//
//struct ContentView: View {
//
//    //@StateObject คือตัวต้นน้ำ จะทำให้สามารถเปลี่ยนแปลงค่าของ Class ได้ (ด้วย Data Manager)
//    @StateObject var task = Task(name: "Check all windows", isComplete: false)
//
//    var body: some View {
//
//        VStack {
//            HStack {
//                Image(systemName: task.isComplete ? "checkmark.square" : "square")
//                Text(task.name)
//            }
//            //Extract Subview
//            ControlView(task: task) //ไม่ต้องใส่ $ เหมือน Stuct แล้ว
//        }
//
//    }
//}
//
//struct ControlView: View {
//
//    //@ObservedObject คือตัวปลายน้ำ สามารถเซทแล้วย้อนกลับไปหาต้นน้ำได้
//    @ObservedObject var task: Task
//
//    var body: some View {
//        Button(task.isComplete ? "Reset" : "Mark Complete") {
//            task.isComplete = !task.isComplete
//        }.padding()
//    }
//}

//Lesson 5 การใช้ @State, @Binding
//let nightlyTasks = [Task(name: "Check all windows", isComplete: false),
//                    Task(name: "Check all doors", isComplete: false),
//                    Task(name: "Check that the safe is locked", isComplete: false),
//                    Task(name: "Check the mailbox", isComplete: false),
//                    Task(name: "Inspect security cameras", isComplete: false),
//                    Task(name: "Clear ice from sidewalks", isComplete: false),
//                    Task(name: "Document strange and unusual occurrences", isComplete: false)]
//
//struct ContentView: View {
//
//    //@State คือตัวต้นน้ำ จะทำให้สามารถเปลี่ยนแปลงค่าของ Struct ได้ (ด้วย Data Manager)
//    @State var task = Task(name: "Check all windows", isComplete: false)
//
//    var body: some View {
//
//        VStack {
//            HStack {
//                Image(systemName: task.isComplete ? "checkmark.square" : "square")
//                Text(task.name)
//            }
//            //Extract Subview
//            ControlView(task: $task) //ใส่ $ คือการส่งต้นน้ำไปหา Binding ที่ปลายน้ำ
//        }
//
//    }
//}
//
//struct ControlView: View {
//
//    //@Binding คือตัวปลายน้ำ สามารถเซทแล้วย้อนกลับไปหาต้นน้ำได้
//    @Binding var task: Task
//
//    var body: some View {
//        Button(task.isComplete ? "Reset" : "Mark Complete") {
//            task.isComplete = !task.isComplete
//        }.padding()
//    }
//}

//Lesson 4 การใช้ TabView
//struct ContentView: View {
//    var body: some View {
//        TabView {
//            Text("Page 1").tabItem { VStack {
//                Image(systemName: "house")
//                Text("Home")
//            } }
//            Text("Page 2").tabItem { Text("Page 2") }
//            Text("Page 3").tabItem { Text("Page 3") }
//        }
//    }
//}

//Lesson 3 การใช้ NavigationView
//struct ContentView: View {
//    var body: some View {
//
//        NavigationView {
//            NavigationLink("Next Page", destination: VStack {
//                Text("Page 2/1")
//                Text("Page 2/2")
//                Text("Page 2/3")
//            })
//        }
//
//    }
//}

//Lesson 2 การใช้ List
//let nightlyTasks = ["Check all windows",
//                    "Check all doors",
//                    "Check that the safe is locked",
//                    "Check the mailbox",
//                    "Inspect security cameras",
//                    "Clear ice from sidewalks",
//                    "Document strange and unusual occurrences"]
//
//let weeklyTasks = ["Check inside all vacent rooms",
//                   "Walk the perimeter of property"]
//
//let monthlyTasks = ["Test security alarm",
//                    "Test motion detectors",
//                    "Test smoke alarms"]
//
//struct ContentView: View {
//    var body: some View {
//
//        NavigationView {
//            List {
//                Section(header: HStack {
//                    Text(Image(systemName: "moon.stars")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
//                    Text("Nightly Tasks").foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
//                }) {
//                    ForEach(nightlyTasks, id: \.self) {
//                        NavigationLink($0, destination: Text($0))
//                    }
//                }
//
//                Section(header: HStack {
//                    Text(Image(systemName: "sunset")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
//                    Text("Weekly Tasks").foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
//                }) {
//                    ForEach(weeklyTasks, id: \.self) {
//                        NavigationLink($0, destination: Text($0))
//                    }
//                }
//
//                Section(header: HStack {
//                    Text(Image(systemName: "calendar")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
//                    Text("Monthly Tasks").foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
//                }) {
//                    ForEach(monthlyTasks, id: \.self) {
//                        NavigationLink($0, destination: Text($0))
//                    }
//                }
//            }.listStyle(GroupedListStyle()).navigationTitle("Home")
//        }
//
//    }
//}

//Lesson 1 การใช้ HStack, VStack
//struct ContentView: View {
//    var body: some View {
//
//        HStack {
//            VStack {
//                VStack(alignment: .leading) {
//
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "moon.stars")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).underline()
//                            Text("Nightly Tasks").foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).underline()
//                        }
//                        Text("Check all windows")
//                        Text("Check all doors")
//                        Text("Check that the safe is locked")
//                        Text("Check the mailbox")
//                        Text("Inspect security cameras")
//                        Text("Clear ice from sidewalks")
//                        Text("Document strange and unusual occurrences")
//                    }
//
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "sunset")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).underline()
//                            Text("Weekly Tasks").foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).underline()
//                        }
//                        Text("Check inside all vacent rooms")
//                        Text("Walk the perimeter of property")
//                    }
//
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "calendar")).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).underline()
//                            Text("Monthly Tasks").foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).underline()
//                        }
//                        Text("Test security alarm")
//                        Text("Test motion detectors")
//                        Text("Test smoke alarms")
//                    }
//                }.foregroundColor(.gray).padding()
//                Spacer()
//            }
//            Spacer()
//        }
//
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewDevice("iPhone 12 Pro Max")
//    }
//}



