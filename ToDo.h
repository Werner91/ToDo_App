//
//  ToDo.h
//  
//
//  Created by Werner on 30.12.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ToDo.h"



@interface ToDo : NSManagedObject

@property (nonatomic, retain) NSString * todo_title;
@property (nonatomic, retain) NSString * todo_description;
@property (nonatomic, retain) NSDate * todo_date;

@end
