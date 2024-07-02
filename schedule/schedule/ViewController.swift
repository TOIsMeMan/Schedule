//
//  ViewController.swift
//  schedule
//
//  Created by MacBook Pro on 30/06/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listView: UICollectionView!
    var tasks: [Task] = []
    var tasksForTable: [TaskForTable] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        addTask(name: "Hoc Tieng Nhat", hour1: 8, minute1: 0, hour2: 10, minute2: 0)
        addTask(name: "Nau An", hour1: 11, minute1: 0, hour2: 11, minute2: 30)
        addTask(name: "Lam viec", hour1: 13, minute1: 0, hour2: 16, minute2: 0)
        addTask(name: "Chay Bo", hour1: 17, minute1: 0, hour2: 18, minute2: 0)
        addTask(name: "Lam them", hour1: 20 , minute1: 0, hour2: 24, minute2: 0)
        
        convertToTableData()
        debugPrint(tasksForTable)
        
//MARK: setup collection view
        listView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        listView.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CollectionViewCell")
        self.listView.delegate = self
        self.listView.dataSource = self
        
// Setup layout cho UICollectionView
        if let layout = listView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            layout.sectionInset = .zero
        }
//hidden scroll bar
        listView.showsVerticalScrollIndicator = false
        listView.showsHorizontalScrollIndicator = false
    }
    
    func addTask(name : String, hour1 : Int, minute1 : Int, hour2 : Int, minute2 : Int) {
        let time1 = Time(hour: hour1, minute: minute1)
        let time2 = Time(hour: hour2, minute: minute2)
        let task = Task(name: name, timeStart: time1, timeFinisth: time2)
        debugPrint(task)
        debugPrint(task.timeStart.timeFrom0h())
        debugPrint(task.timeFinisth.timeFrom0h())
        debugPrint("---------------------------------------------------------------------------------")
        tasks.append(task)
    }
    
    func convertToTableData() {
        tasksForTable.removeAll()
        for i in 0...tasks.count - 1 {
            if (i == 0) {
                if (tasks[i].timeStart.timeFrom0h() != 0) {
                    let taskToTable = TaskForTable(time: tasks[i].timeStart.timeFrom0h(), color: .green)
                    tasksForTable.append(taskToTable)
                }
                let taskToTable = TaskForTable(time: tasks[i].timeFinisth.timeFrom0h() - tasks[i].timeStart.timeFrom0h(), color: .red, indexOfTasks: i)
                tasksForTable.append(taskToTable)
            } else {
                if (tasks[i].timeStart.timeFrom0h() != tasks[i - 1].timeFinisth.timeFrom0h()) {
                    let taskToTable = TaskForTable(time: tasks[i].timeFinisth.timeFrom0h() - tasks[i].timeStart.timeFrom0h(), color: .green)
                    tasksForTable.append(taskToTable)
                }
                let taskToTable = TaskForTable(time: tasks[i].timeFinisth.timeFrom0h() - tasks[i].timeStart.timeFrom0h(), color: .red, indexOfTasks: i)
                tasksForTable.append(taskToTable)
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasksForTable.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if (tasksForTable[indexPath.row].indexOfTasks == -1) {
            cell.renderFreeTime()
        } else {
            cell.renderTask(timeStart: tasks[tasksForTable[indexPath.row].indexOfTasks].timeStart.show(), timeFinish: tasks[tasksForTable[indexPath.row].indexOfTasks].timeFinisth.show())
            debugPrint(tasks[tasksForTable[indexPath.row].indexOfTasks].timeStart.show())
            debugPrint(tasks[tasksForTable[indexPath.row].indexOfTasks].timeFinisth.show())
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.size.width, height: CGFloat(tasksForTable[indexPath.row].time) * 1.5)
    }
}
