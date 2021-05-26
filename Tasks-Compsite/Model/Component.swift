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
