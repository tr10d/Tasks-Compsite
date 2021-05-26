//
//  ViewController.swift
//  Tasks-Compsite
//
//  Created by  Sergei on 26.05.2021.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var navigationTitle: UINavigationItem!
  @IBOutlet private weak var backButtom: UIBarButtonItem!
  @IBOutlet private weak var taskButton: UIBarButtonItem!
  @IBOutlet private weak var subtaskButton: UIBarButtonItem!
  @IBOutlet private weak var pathLabel: UILabel!
  
  private let viewModel = ViewControllerModel()

  @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
    viewModel.goBack()
    tableView.reloadData()
    updateView()
  }
  
  @IBAction func taskButtonAction(_ sender: UIBarButtonItem) {
    add(task: Task(name: "Задача \(rendomNumber())"))
  }
  
  @IBAction func subtaskButtonAction(_ sender: UIBarButtonItem) {
    add(task: SubTask(name: "Подзадача \(rendomNumber())"))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configTableView()
    updateView()
  }
  
  func updateView() {
    backButtom.isEnabled = !viewModel.task.isRoot()
    subtaskButton.isEnabled = !viewModel.task.isRoot() && viewModel.task.isTask()
    taskButton.isEnabled = viewModel.task.isTask()
    navigationTitle.title = viewModel.task.name
    pathLabel.text = viewModel.task.path()
  }
  
  func add(task: Component) {
    viewModel.addTask(task: task)
    tableView.reloadData()
  }
  
  private func rendomNumber() -> String {
    String(UUID().uuidString.suffix(4))
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func configTableView() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.task.countElements()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let task = viewModel.task.getSubTask(for: indexPath.row) else { return UITableViewCell() }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = task.name
    cell.detailTextLabel?.text = "\(task.countTasks())"
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let task = viewModel.task.getSubTask(for: indexPath.row) else { return }
    
    viewModel.goNext(task: task)
    tableView.reloadData()
    updateView()
  }
}
