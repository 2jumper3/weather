//
//  FilesDataStorage.swift
//  WeatherApp
//
//  Created by Sergey on 19/03/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import Foundation

class FilesDataStorage {
    private init () {}
    
    static let shared = FilesDataStorage()
    
    func getFileFromApp(fileName: String) -> String? {
        return Bundle.main.path(forResource: fileName, ofType: nil)
    }
    
    //    папки Documents: всё хранится, копия из айтюнса сохраняется
    func save(data: Data, fileName: String) {
        guard let path = self.documentsPath(fileName: fileName) else {
            return
        }
        if FileManager.default.fileExists(atPath: path) {
            try? FileManager.default.removeItem(atPath: path)
        }
        FileManager.default.createFile(atPath: path, contents: data, attributes: nil)
     }
    func documentsPath(fileName: String) -> String? {
        guard var documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return nil
        }
        
        documentsPath.append("/")
        documentsPath.append(fileName)
        return documentsPath
    }
}
