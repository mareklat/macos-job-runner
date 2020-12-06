//
//  JobIdFromUrlHandler.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation
import RxSwift

class JobIdFromUrlHandler {
    
    private let jobId = BehaviorSubject<Int?>(value: nil)
    
    func set(id: Int) {
        jobId.onNext(id)
    }
    
    func loadAndListen() -> Observable<Int> {
        return jobId.asObservable()
            .filter { id in id != nil}
            .map { id in id!}
    }
    
}
