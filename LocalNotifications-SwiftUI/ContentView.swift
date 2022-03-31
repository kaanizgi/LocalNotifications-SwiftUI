//
//  ContentView.swift
//  notifications
//
//  Created by Kaan İzgi on 1.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var date = Date()
    @State var title = ""
    @State var subtitle = ""
    
    var body: some View {
       
            VStack(spacing:25) {
                
                DatePicker("Date", selection: $date)
                    .padding()
                TextField("Title", text: $title)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(.gray)
                    .cornerRadius(15)
                TextField("Detail", text: $subtitle)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(.gray)
                    .cornerRadius(16)

                
                Button {
                    NotificationManager.instance.scheduleNotification(title: "\(title)", subtitle: "\(subtitle)", date: date)
                } label: {
                    Text("Set")
                        .font(.title3)
                        .bold()
                        .frame(height:50)
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15)
                }
               
                
                /*Button {
                    NotificationManager.instance.deleteNotification()
                    print("cancel")
                } label: {
                    Text("Delete notifi")
                        .font(.title)
                        .bold()
                        .frame(height:50)
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15)
                }
                .padding()
                 */
                Spacer()
            }.padding()
            .onAppear {
                UIApplication.shared.applicationIconBadgeNumber = 0
                NotificationManager.instance.requestAuthorization()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
