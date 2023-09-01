//
//  Command.swift
//  
//
//  Created by Julio Alorro on 31.08.23.
//

import struct Foundation.Date

/**
 A Command is a type of Request that modifies the state of a system
 */
public protocol Command: Hashable, Request {}
