//
//  BookListModels.swift
//  BookFinder
//
//  Created by 18101004 on 2021/09/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum BookList
{
    // MARK: Use cases
    
    enum FetchBooks
    {
        struct Request
        {
            var queryText: String
            var startIndex: Int
        }
        struct Response: Codable
        {
            var kind: String
            var totalItems: Int
            var items: [Book]?
        }
        struct ViewModel
        {
            struct DisplayedBook {
                var id: String
                var imageUrl: String
                var title: String
                var author: String
                var date: String
            }
            
            var displayedBooks: [DisplayedBook]
            var totalItemCnt: Int
        }
    }
}
