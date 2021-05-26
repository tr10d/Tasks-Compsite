//
//  ViewControllerModel.swift
//  Tasks-Compsite
//
//  Created by  Sergei on 26.05.2021.
//

import Foundation

class ViewControllerModel {
  var task: Component = Task(name: "Корень")
  
  func addTask(task: Component) {
    self.task.add(component: task)
  }
  
  func goNext(task: Component) {
    self.task = task
  }
  
  func goBack() {
    guard let parent = task.parent else {
      return
    }
    task = parent
  }
}
