//
//  ContentView.swift
//  SwiftUIBasesP2
//
//  Created by Keto Nioradze on 08.12.23.
//

import SwiftUI

struct TaskModel: Identifiable {
    let id = UUID()
    var taskTitle: String
    var taskDate: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State var allTasks = [
        TaskModel(taskTitle: "Website Research", taskDate: "5 Oct", isCompleted: true),
        TaskModel(taskTitle: "Mobile App Research", taskDate: "4 Oct", isCompleted: false),
        TaskModel(taskTitle: "Prepare Wireframe for Main Flow", taskDate: "4 Oct", isCompleted: false),
        TaskModel(taskTitle: "Prepare Screens", taskDate: "4 Oct", isCompleted: false),
        TaskModel(taskTitle: "Website Research", taskDate: "5 Oct", isCompleted: true),
        TaskModel(taskTitle: "Prepare Wireframe for Main Flow", taskDate: "5 Oct", isCompleted: false),
        TaskModel(taskTitle: "Prepare Wireframe for Main Flow", taskDate: "5 Oct", isCompleted: false),
        TaskModel(taskTitle: "Prepare Screens", taskDate: "5 Oct", isCompleted: true)
    ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 150) {
                Text("You have \((allTasks.filter{ !$0.isCompleted }).count) tasks to complete")
                    .frame(width: 200)
                    .font(.title2 .weight(.bold))
                
                ZStack(alignment: .bottomTrailing){
                    
                    Image("Gojo")
                        .resizable()
                        .clipShape(Circle())
                    
                    Text("\((allTasks.filter{ $0.isCompleted }).count)")
                        .frame(width: 15, height: 15)
                        .background(Color.red)
                        .clipShape(.circle)
                }
                .frame(width: 45, height: 45)
            }
            
            Button(action: {
                for index in allTasks.indices {
                    allTasks[index].isCompleted = true
                }
            }, label: {
                Text("Complete All")
                    .font(.title3 .weight(.bold))
            })
            .frame(width: 390, height: 50)
            .background(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(8)
            .foregroundColor(.white)
            .padding(.vertical, 20)

            Text("Completed Tasks")
            
            ScrollView {
                LazyVStack{
                    
                    ForEach(allTasks.filter { $0.isCompleted }) { task in
                        TasksViewFile(taskModel: task)
                    }
                    
                    ForEach(allTasks.filter { !$0.isCompleted }) { task in
                        TasksViewFile(taskModel: task)
                    }
                }
            }
        }
        .padding()
        .background(.black)
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
