//
//  Component.swift
//  Tasks-Compsite
//
//  Created by  Sergei on 26.05.2021.
//

import Foundation

protocol Component {
  var parent: Component? { get set }
  var name: String { get set }
  
  func add(component: Component)
  func isTask() -> Bool
  func isRoot() -> Bool
  func countTasks() -> Int
  func countElements() -> Int
  func getSubTask(for index: Int) -> Component?
  func path() -> String
}

extension Component {
  func add(component: Component) {}
  
  func countTasks() -> Int {
    return 0
  }
  
  func countElements() -> Int {
    return 0
  }
  
  func isTask() -> Bool {
    return false
  }
  
  func isRoot() -> Bool {
    parent == nil
  }
  
  func getSubTask(for index: Int) -> Component? {
    nil
  }
  
  func path() -> String {
    guard let parent = parent else {
      return ""
    }
    return "\(parent.path())\\\(parent.name)"
  }
}

class SubTask: Component {
  var name: String
  var parent: Component?
  
  init(name: String) {
    self.name = name
  }
}

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
  
  func countTasks() -> Int {
    children.reduce(0) { $0 + $1.countTasks() }
  }
  
  func countElements() -> Int {
    return children.count
  }
  
  func getSubTask(for index: Int) -> Component? {
    children[index]
  }
}
