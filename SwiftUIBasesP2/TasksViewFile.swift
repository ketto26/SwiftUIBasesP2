//
//  TasksViewFile.swift
//  SwiftUIBasesP2
//
//  Created by Keto Nioradze on 09.12.23.
//

import SwiftUI

struct TasksViewFile: View {
    
    @State var taskModel: TaskModel
    
    var body: some View {
        HStack(spacing: 10){
            Rectangle()
                .fill(Color.red)
                .frame(width: 10)
                .padding(.horizontal, 0)
            
            VStack{
                
                Text("\(taskModel.taskTitle)")
                
                HStack{
  
                    Text("\(taskModel.taskDate)")
                        .font(.caption)
                }
            }
            
            Spacer()
            Image(systemName: taskModel.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(taskModel.isCompleted ? .purple : .purple)
                .onTapGesture {
                    taskModel.isCompleted.toggle()
                }
                .frame(width: 30)
        }
        .frame(height: 80)
        .background(Color(red: 0.31, green: 0.31, blue: 0.31))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .foregroundColor(.white)
    }
}

#Preview {
    TasksViewFile(taskModel: TaskModel(taskTitle: "Hello", taskDate: "4 Oct", isCompleted: true))
}
