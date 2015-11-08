//
//  Constants.swift
//  Nostrajamus
//
//  Created by Vincent Ning on 10/21/15.
//  Copyright © 2015 Nostrajamus, LLC. All rights reserved.
//

import UIKit

class Constants {
    
    /* Base Endpoints */
    static let baseURL: String = "http://nostrajamus.com/api/"
    static let baseURLAuth: String = "http://nostrajamus.com/"
    static let soundcloudClientId: String = "client_id=f0b7083f9e4c053ca072c48a26e8567a"
    /* End Base Endpoints */
    
    /* REST Endpoints */
    static let authURL: String = "api-token-auth/"
    static let meURL: String = "users/me/"
    static let contestsURL: String = "contests/"
    static let contestEntriesURL: String = "/entries/"
    /* End REST Endpoints */
    
    /* Errors */
    static let loginError: String = "Incorrect username / password. Try again."
    /* End Errors */
    
}