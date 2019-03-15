//
//  AddCityTableViewController.swift
//  WeatherApp
//
//  Created by Stanislav Ivanov on 29/01/2019.
//  Copyright © 2019 Stanislav Ivanov. All rights reserved.
//

import UIKit

// Набор методов, которые мы не знаем как реализовать на текущем UIViewController
protocol AddGroupDeligate: class {
    func addGroup(group: Group)
}


class AllGroupsTableViewController: UITableViewController {
    
    //  Объект, который умеет добавлять города
    weak var delegate: AddGroupDeligate?
    
    //  Массив городов
    private var groups: [Group] = []
    var groupsFilter: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      Заполняем массив городов данными
        let allGroups = ["Первая", "Вторая", "Третья", "Четвертая"]
        for name in allGroups {
            let group = Group()
            group.name = name
            
            self.groups.append(group)
        }
        
        self.filter(query: "")
    }
    
    // MARK: - Table view data source
    
    //  Количество ячеек в таблице = количеству городов в массиве
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groupsFilter.count
    }
    
    //  Возвращаем ячейку для нужного города
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as! AllGroupsTableViewCell
        
        let group = self.groupsFilter[indexPath.row]
        cell.setGroup(group: group)
        
        return cell
    }
    
    //  Выбор ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //      Убираем выделение с ячейки
        tableView.deselectRow(at: indexPath, animated: true)
        
        //      Получаем город
        let group = self.groupsFilter[indexPath.row]
        
        //      Добавляем город
        self.addGroup(group: group)
    }
}

extension AllGroupsTableViewController {
    
    //  Так как на текущем экране мы не знаем как добавить город, просто поручаем это делегату
    func addGroup(group: Group) {
        self.delegate?.addGroup(group: group)
    }
    
    func filter(query: String) {
        self.groupsFilter.removeAll()
        
        for group in self.groups {
            
            guard let name = group.name else {
                continue
            }
            
            var isInFilter = true
            
            if query.count > 0 {
                isInFilter = name.lowercased().contains(query.lowercased())
            }
            
            if isInFilter {
                self.groupsFilter.append(group)
            }
        }
        
        self.tableView.reloadData()
    }
}

extension AllGroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filter(query: searchText)
    }
}
