//
//  ContentView.swift
//  RemindersSample
//
//  Created by Ryo on 2022/09/28.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State var menu = "全て"
    
    @State var sheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.eventManager.data,id: \.self) { reminders in
                    Text(reminders.title)
                  
                }
               
            }
            .navigationTitle("リマインダー")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu(menu) {
                        Button {
                            menu = "全て"
                        } label: {
                            Text("全て")
                        }
                        Button {
                            menu = "プライベート"
                        } label: {
                            Text("プライベート")
                        }
                        Button {
                            menu = "学校"
                        } label: {
                            Text("学校")
                        }
                        Button {
                            menu = "卒業制作"
                        } label: {
                            Text("卒業制作")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //ハーフシートでリマインダーの追加
                        sheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("N", modifiers: [.command])
                }
            }
            .sheet(isPresented: $sheet, content: {
                AddRemindersView()
                    .presentationDetents([.medium])
            })
            
            .refreshable {
                //TODO: リストの更新
                viewModel.update()
            }
            .keyboardShortcut("R", modifiers: [.command])
        }
        .onAppear(){
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
