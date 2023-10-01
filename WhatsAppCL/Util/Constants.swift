//
//  Constants.swift
//  WhatsAppCL
//
//  Created by Semih ŞENOL on 29.09.2023.
//


import Foundation
import UIKit

let userDefaults = UserDefaults.standard

// NOTIFICATIONS
public let USER_DID_LOGIN_NOTIFICATION  = "UserDidLoginNotification"
public let APP_STARTED_NOTIFICATIN      = "AppStartedNotification"

// Firebase Headers
public let kUSER_PATH           = "User"
public let kTYPINGPATH_PATH     = "Typing"
public let kRECENT_PATH         = "Recent"
public let kMESSAGE_PATH        = "Message"
public let kGROUP_PATH          = "Group"
public let kCALL_PATH           = "Call"

// FUser
public let kOBJECTID            = "objectId"
public let kEMAIL               = "email"
public let kPHONE               = "phone"
public let kCOUNTRYCODE         = "countryCode"
public let kFULLNAME            = "name"
public let kAVATAR              = "avatar"
public let kCURRENTUSER         = "currentUser"
public let kISONLINE            = "isOnline"
public let kVERIFICATIONCODE    = "firebase_verification"
public let kFILEREFERENCE       = "gs://whatsappcl-fbadf.appspot.com"

//
public let kBACKGROUNGIMAGE     = "backgroundImage"
public let kSHOWAVATAR          = "showAvatar"
public let kPASSWORDPROTECT     = "passwordProtect"
public let kFIRSTRUN            = "firstRun"
public let kNUMBEROFMESSAGE     = 10
public let kMAXDURATION         = 120.0
public let kAUDIOMAXDURATION    = 120.0
public let kSUCCESS             = 2

// recent
public let kCHATROOMID          = "chatRoomId"
public let kUSERID              = "userId"
public let kDATE                = "date"
public let kPRIVATE             = "private"
public let kGROUP               = "group"
public let kGROUPID             = "groupId"
public let kRECENTID            = "recentId"
public let kMEMBERS             = "members"
public let kMESSAGE             = "message"
public let kMEMBERSTOPUSH       = "membersToPush"
public let kDISCRIPTION         = "discription"
public let kLASTMESSAGE         = "lastMessage"
public let kCOUNTER             = "counter"
public let kTYPE                = "type"
public let kWITHUSERUSERNAME    = "withUserUsername"
public let kWITHUSERUSERID      = "withUserUserId"
public let kOWNERID             = "ownerId"
public let kSTATUS              = "status"
public let kMESSAGEID           = "messageId"
public let kNAME                = "name"
public let kSENDERID            = "senderId"
public let kSENDERNAME          = "senderName"
public let kTHUMBNAIL           = "thumbnail"
public let kISDELETED           = "isDeleted"

// Contacts
public let kCONTACT             = "contact"
public let kCONTACTID           = "contactId"

// Message types
public let kPICTURE             = "picture"
public let kTEXT                = "text"
public let kVIDEO               = "video"
public let kAUDIO               = "audio"
public let kLOCATION            = "location"

// Coordinates
public let kLATITUDE            = "latitude"
public let kLONGITUDE           = "longitude"

// Message Status
public let kDELIVERED           = "delivered"
public let kREAD                = "read"
public let kEADDATE             = "readDate"
public let kDELETED             = "deleted"

// Push
public let kDEVICEID            = "deviceId"

// Call
public let kISINCOMING          = "isIncoming"
public let kCALLERID            = "callerId"
public let kCALLERFULLNAME      = "callerFullName"
public let kCALLSTATUS          = "callStatus"
public let kWITHUSERFULLNAME    = "withUserFullName"
public let kCALLERAVATAR        = "callerAvatar"
public let kWITHUSERAVATAR      = "withUserAvatar"
