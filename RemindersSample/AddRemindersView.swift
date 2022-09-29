//
//  AddRemindersView.swift
//  RemindersSample
//
//  Created by Ryo on 2022/09/28.
//

import SwiftUI

struct AddRemindersView: View {
    //モーダルを戻るための変数
    @Environment(\.presentationMode) var presentation
    @State var title = ""
    //優先順位
    @State var stars = 0
    
    var body: some View {
        NavigationStack {
            List {
                TextField("タイトル", text: $title)
                HStack {
                    Text("優先順位")
                    
                    Spacer()
                    
                    ForEach(0..<3) { index in
                        Button {
                            //選択済みをもう一度タップで初期化
                            if stars == index + 1 {
                                stars = 0
                            } else {
                                stars = index + 1
                            }
                        } label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(index < stars ? Color.accentColor : Color(.quaternaryLabel))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("リマインダー")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(role: .cancel) {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("キャンセル")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //TODO: リマオンダーに追加
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("追加")
                    }
                }
            }
        }
    }
}

struct AddRemindersView_Previews: PreviewProvider {
    static var previews: some View {
        AddRemindersView()
    }
}
