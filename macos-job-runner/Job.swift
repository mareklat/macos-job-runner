//
//  Job.swift
//  job-runner
//
//  Created by Marek Latuszek on 04/12/2020.
//

import Foundation

struct Job {
    let id: Int
    let script: String
    let artifacts: [String]
    let created: Date
    let status: JobStatus
    let generatedArtifacts: [String]
}
