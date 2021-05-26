//
//  Task.swift
//  Tasks-Compsite
//
//  Created by  Sergei on 26.05.2021.
//

import Foundation

class Task: Component {
  var name: String
  var parent: Component?
  var children = [Component]()
  
  init(name: String) {
    self.name = name
  }

  func add(component: Component) {
    var item = component
    item.parent = self
    children.append(item)
  }
  
  func isTask() -> Bool {
    return true
  }
  
  func countElements() -> Int {
    return children.count
  }
  
  func countTasks() -> Int {
    countElements() + children.reduce(0) { $0 + $1.countTasks() }
  }
  
  func getSubTask(for index: Int) -> Component? {
    children[index]
  }
}
