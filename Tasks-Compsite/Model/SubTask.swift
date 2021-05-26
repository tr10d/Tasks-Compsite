//
//  SubTask.swift
//  Tasks-Compsite
//
//  Created by  Sergei on 26.05.2021.
//

import Foundation

class SubTask: Component {
  var name: String
  var parent: Component?
  
  init(name: String) {
    self.name = name
  }
}
