//
//  ContentView.swift
//  NightWatch
//
//  Created by Bond on 27/1/2564 BE.
//

import SwiftUI

let nightlyTasks = ["Check all doors",
                 "Check that the safe is locked",
                 "Check the mailbox",
                 "Inspect security cameras",
                 "Clear ice from sidewalks",
                 "Document strange and unusual occurrences"]
let weeklyTasks = ["Check inside all vacant rooms",
                   "Walk the perimeter of property"]
let monthlyTasks = ["Test security alarm",
                    "Test motion detectors",
                    "Test smoke alarms"]

struct ContentView: View {
    var body: some View {

        NavigationView {
            List {
                Section(header: HStack {
                    Text(Image(systemName: "moon.stars")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Nightly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }) {
                    ForEach(nightlyTasks, id: \.self) {
                        NavigationLink($0, destination: Text($0))
                    }
                }

                Section(header: HStack {
                    Text(Image(systemName: "sunset")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Weekly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }) {
                    ForEach(weeklyTasks, id: \.self) {
                        NavigationLink($0, destination: Text($0))
                    }
                }

                Section(header: HStack {
                    Text(Image(systemName: "calendar")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Monthly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }) {
                    ForEach(monthlyTasks, id: \.self) {
                        NavigationLink($0, destination: Text($0))
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
        }

    }
}

//struct ContentView: View {
//    var body: some View {
//
//        TabView {
//            Text("Page 1").tabItem {
//                Image(systemName: "square.and.pencil")
//                Text("Tab 1")
//            }
//            Text("Page 2").tabItem {
//                Image(systemName: "calendar")
//                Text("Tab 2")
//            }
//            Text("Page 3").tabItem {
//                Image(systemName: "sunset")
//                Text("Tab 3")
//            }
//        }
//    }
//}


//struct ContentView: View {
//    var body: some View {
//
//        List {
//            Section(header: HStack {
//                Text(Image(systemName: "moon.stars")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text("Nightly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//            }) {
//                ForEach(nightlyTasks, id: \.self) {
//                    Text($0)
//                }
//            }
//
//            Section(header: HStack {
//                Text(Image(systemName: "sunset")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text("Weekly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//            }) {
//                ForEach(weeklyTasks, id: \.self) {
//                    Text($0)
//                }
//            }
//
//            Section(header: HStack {
//                Text(Image(systemName: "calendar")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text("Monthly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//            }) {
//                ForEach(monthlyTasks, id: \.self) {
//                    Text($0)
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
//
//    }
//}

//struct ContentView: View {
//    var body: some View {
//
//        HStack {
//            VStack {
//                VStack(alignment: .leading) {
//
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "moon.stars")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            Text("Nightly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        }
//                        Text("Check all windows")
//                        Text("Check all doors")
//                        Text("Check that the safe is locked")
//                        Text("Check the mailbox")
//                        Text("Inspect security cameras")
//                        Text("Clear ice from sidewalks")
//                        Text("Document strange and unusual occurrences")
//
//                    }
//
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "sunset")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            Text("Weekly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        }
//                        .padding(.top)
//                        Text("Check inside all vacant rooms")
//                        Text("Walk the perimeter of property")
//                    }
//
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "calendar")).font(.title3).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            Text("Monthly Tasks").font(.title3).foregroundColor(.yellow).underline().fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        }
//                        .padding(.top)
//                        Text("Test security alarm")
//                        Text("Test motion detectors")
//                        Text("Test smoke alarms")
//                    }
//
//                }.foregroundColor(.gray)
//                Spacer()
//            }.padding()
//
//            Spacer()
//        }
//
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
    }
}

