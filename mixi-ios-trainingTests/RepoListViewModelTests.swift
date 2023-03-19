//
//  mixi_ios_trainingTests.swift
//  mixi-ios-trainingTests
//
//  Created by 出口楓真 on 2023/03/18.
//

import XCTest
@testable import mixi_ios_training

final class RepoListViewModelTests: XCTestCase {

    func test_onAppear_正常系() async {
        let viewModel = await RepoListViewModel(
            repoRepository: MockRepoRepository(
                repos: [.mock1, .mock2]
            )
        )

        await viewModel.onAppear()

        switch await viewModel.state {
        case let .loaded(repos):
            XCTAssertEqual(repos, [Repo.mock1, Repo.mock2])
        default:
            XCTFail()
        }
    }

    func test_onAppear_異常系() async {
        let viewModel = await RepoListViewModel(
            repoRepository: MockRepoRepository(
                repos: [],
                error: DummyError()
            )
        )

        await viewModel.onAppear()

        switch await viewModel.state {
        case let .failed(error):
            XCTAssert(error is DummyError)
        default:
            XCTFail()
        }

    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
