//
//  credentials.c
//  ZPDoorbellUltra
//
//  Created by Doug Feigelson on 2/18/13.
//  Copyright (c) 2013 Doug Feigelson. All rights reserved.
//

// Copy this file to "credentials.m" and fill out the IPs, ports, and secret keys.
// See readme for more details.

static NSString* DOORBELL_URL = @"http://18.228.0.200:5000/doorbell?key=ASECRETKEY";
static NSString* DELIVERY_URL = @"http://18.228.0.200:5000/doorbell?key=ASECRETKEY";
static NSString* ARBITRARY_TEXT_URL = @"http://18.228.0.200:5000/doorbell?key=ASECRETKEY&txt=";

static NSString* INFO_URL = @"http://18.228.0.200/feed.html";