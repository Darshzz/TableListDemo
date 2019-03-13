//
//  TableListDemoTests.swift
//  TableListDemoTests
//
//  Created by Darshan on 09/03/19.
//  Copyright © 2019 Darshan. All rights reserved.
//

import XCTest
@testable import TableListDemo

class TableListDemoTests: XCTestCase {

    var listVM: ListViewModel? = ListViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        listVM?.listVMDelegate = self
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        listVM = nil
    }

    func testMockData() {
        let array = [ListModel(title: "title1", description: "desc1", imageHref: "http://"),
                     ListModel(title: "title2", description: "desc2", imageHref: "http://"),
                     ListModel(title: "title3", description: "desc3", imageHref: "http://"),
                     ListModel(title: "title4", description: "desc4", imageHref: "http://"),
                     ListModel(title: "title5", description: "desc5", imageHref: "http://"),
                     ListModel(title: nil, description: nil, imageHref: nil)]
        
        XCTAssertEqual(array[0].title, "title1")
        XCTAssertEqual(array[1].title, "title2")
        XCTAssertEqual(array[2].description, "desc3")
        XCTAssertEqual(array[3].description, "desc4")
        XCTAssertEqual(array[4].imageHref, "http://")
        
        let dataModel = DataModel(title: "Demo", rows: array)
        XCTAssertTrue(dataModel.rows == array)
        //XCTAssertFalse(dataModel.rows == array)
        
        listVM?.dataModel = dataModel
    }
}

extension TableListDemoTests: ListVMDelegate {
    
    func userDataChanged(_ error: String?) {
        print("delegate called")
        // Check datamodel if there is null dictionary from response or model containing nil values are removed fron array.
        print((listVM?.dataModel?.rows)!)
    }
}
