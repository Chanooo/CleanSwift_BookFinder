//
//  BookListInteractor.swift
//  BookFinder
//
//  Created by CNOO on 2021/09/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BookListBusinessLogic
{
    func fetchBooks(request: BookList.FetchBooks.Request)
}

protocol BookListDataStore
{
    var books: [Book]? { get }
}

class BookListInteractor: BookListBusinessLogic, BookListDataStore
{
    var presenter: BookListPresentationLogic?
    
    var bookListWorker = BookListWorker()
    var books: [Book]? = []
    
    // MARK: fetch books
    
    func fetchBooks(request: BookList.FetchBooks.Request)
    {
        bookListWorker.fetchBooks(request: request) { result in
            switch result {
            case .success(let response):
                // store DataStore
                if request.startIndex == 0 {
                    self.books = response.items
                } else {
                    self.books! += response.items ?? []
                }
                // present Response
                self.procResponse(response: response)
            case .failure(let error):
                printError(error.localizedDescription)
                self.procResponse(response: nil)
            }
        }
    }
    
    func procResponse(response: BookList.FetchBooks.Response?)
    {
        if let response = response {
            self.presenter?.presentFetchedBooks(response: response)
        } else {
            self.presenter?.presentError()
        }
    }
    
}
