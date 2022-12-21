//
//  UberCloneTests.swift
//  UberCloneTests
//
//  Created by Admin on 17/12/2022.
//

import XCTest
@testable import Uber_Clone
@testable import FirebaseAuth

final class MockLoginController: AuthAlertProtocol {
    
    let viewModel: LoginViewModelProtocol
    
    var errorMassage = ""
    
    func showAlert(error: String) {
        
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}
//
//final class AuthServiceMock: AuthServiceProtocol {
//
//    struct AuthorizationArguments: Equatable {
//
//        var email: Email
//        var password: Password
//    }
//
//    private(set) var authorizeUserInvocations: [AuthorizationArguments] = []
//    private let authorizationResult: (AuthDataResult?, Error?)
//
//    init(authorizationResult: (AuthDataResult?, Error?)) {
//        self.authorizationResult = authorizationResult
//    }
//
//    func registrationUser(withCredential credentials: Uber_Clone.AuthCredential, completion: @escaping (Error?) -> Void) {
//        authorizeUserInvocations.append(.init(email: credentials.email, password: credentials.password))
//        completion(authorizationResult.0, authorizationResult.1)
//    }
//
//    func registrationUser(email: Uber_Clone.Email, password: Uber_Clone.Password) {
//
//    }
//}
//
//final class LoginViewModelTest: XCTestCase {
//
//    var viewModel: LoginViewModel!
//    var authService: AuthServiceMock!
//    var router: RouterProtocol!
//    var mockView: MockLoginController!
//
//    override func setUp() {
//        let nav = RootNavigationController()
//        let assambly = AssemblyModuleBuilderImplementation()
//        router = Router(navigationController: nav, assemblyBuilder: assambly)
//    }
//
//    override func tearDown() {
//        authService = nil
//        viewModel = nil
//        mockView = nil
//    }
//
//    func testAuthorizeUser_InvalidEmail() {
//        authService = AuthServiceMock(authorizationResult: (nil, nil))
//        viewModel = LoginViewModel(authService: authService, router: router)
//        viewModel.logInWithEmail(email: "foo", password: "123456")
//        XCTAssertEqual(authService.authorizeUserInvocations.count, 0)
//    }
//
//    func testAuthorizeUser_InvalidPassword() {
//        authService = AuthServiceMock(authorizationResult: (nil, nil))
//        viewModel = LoginViewModel(authService: authService, router: router)
//        viewModel.logInWithEmail(email: "foo@gmail.com", password: "12345")
//        XCTAssertEqual(authService.authorizeUserInvocations.count, 0)
//    }
//
//    func testAuthorizeUzer_HappyPath() throws {
//        authService = AuthServiceMock(authorizationResult: (nil, nil))
//        viewModel = LoginViewModel(authService: authService, router: router)
//        viewModel.logInWithEmail(email: "email@email.com", password: "123456")
//
//        XCTAssertEqual(authService.authorizeUserInvocations.count, 1)
//        let invocationArguments = try XCTUnwrap(authService.authorizeUserInvocations.first)
//        XCTAssertEqual(invocationArguments, .init(email: Email("email@email.com")!, password: Password("123456")!))
//    }
//
//    func testAuthorizeUzer_ErrorPath() throws {
//        let error = NSError()
//        authService = AuthServiceMock(authorizationResult: (nil, error))
//        viewModel = LoginViewModel(authService: authService, router: router)
//        viewModel.logInWithEmail(email: "email@email.com", password: "123456")
//
//        mockView = MockLoginController(viewModel: viewModel)
//        viewModel.delegate = mockView
//
//       // XCTAssertEqual(error.localizedDescription, mockView.errorMassage)
//
//        XCTAssertEqual(authService.authorizeUserInvocations.count, 1)
//        let invocationArguments = try XCTUnwrap(authService.authorizeUserInvocations.first)
//        XCTAssertEqual(invocationArguments, .init(email: Email("email@email.com")!, password: Password("123456")!))
//    }
//}
