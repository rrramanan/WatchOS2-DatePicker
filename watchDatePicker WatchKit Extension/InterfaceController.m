//
//  InterfaceController.m
//  watchDatePicker WatchKit Extension
//
//  Created by Vinod Ramanathan on 15/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController
NSMutableArray *MonthArray;
NSMutableArray *MonthLoad;
NSMutableArray *MonthNumLoad;
NSMutableArray *DayArray;
NSMutableArray *DayLoad;
NSMutableArray *YearArray;
NSMutableArray *YearLoad;
NSString *getTotalDate;

NSString   *month;
NSString   *day;
NSString   *year;

NSString   *getMonth = @"01";
NSString   *getDay   = @"01";
NSString   *getYear  = @"2015";

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
MonthArray = [[NSMutableArray alloc]init];
    
MonthLoad = [[NSMutableArray alloc]initWithObjects:@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC", nil];
    
MonthNumLoad = [[NSMutableArray alloc]  initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    
DayArray = [[NSMutableArray alloc]init];
    
DayLoad = [[NSMutableArray alloc]  initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31", nil];
   
    
YearArray = [[NSMutableArray alloc]init];
    
YearLoad = [[NSMutableArray alloc] initWithObjects:@"2015",@"2016",@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025",@"2026",@"2027",@"2028",@"2029",@"2030", nil];
    
    
    
    for(int i=0; i < [DayLoad count]; i++) {
        WKPickerItem *item = [[WKPickerItem alloc] init];
        NSString *title = [DayLoad objectAtIndex:i];
        item.title = title;
        [DayArray addObject:item];
    }
    
    
    for(int i=0; i < [MonthLoad count]; i++) {
        WKPickerItem *item = [[WKPickerItem alloc] init];
        NSString *title = [MonthLoad objectAtIndex:i];
        item.title = title;
        [MonthArray addObject:item];
    }
    
    
    for(int i=0; i < [YearLoad count]; i++) {
        WKPickerItem *item = [[WKPickerItem alloc] init];
        NSString *title = [YearLoad objectAtIndex:i];
        item.title = title;
        [YearArray addObject:item];
    }
    
    
    [_Month setItems:MonthArray];
    [_Day setItems:DayArray];
    [_Year setItems:YearArray];
    
  
    
    //Set Picker to current date ***

    
    NSDate *today1 = [NSDate date];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    
    
    [dateFormat1 setDateFormat:@"MM"];
    month =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",month);
    
    
    [dateFormat1 setDateFormat:@"dd"];
    day =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",day);
    
   
    [dateFormat1 setDateFormat:@"yyyy"];
    year =[dateFormat1 stringFromDate:today1];
    NSLog(@"%@",year);
    
    
    
    //Set Current Month
    
    for(int i=0; i < [MonthLoad count]; i++) {
        
        NSString *compmonth = [MonthNumLoad objectAtIndex:i];
        
        if ([month isEqualToString:compmonth]) {
            
            int  monthmatch = i;
            
            NSLog(@"monthmatch --- %d",i);
            
            if (monthmatch == 0) {
                
                [_Month_Label setText:@"01"];
                
            }
            
            [_Month setSelectedItemIndex:monthmatch];
            
        }
        
    }

    

    //Set Current Day
    
    for(int i=0; i < [DayLoad count]; i++) {
       
        NSString *compday = [DayLoad objectAtIndex:i];
        
        if ([day isEqualToString:compday]) {
            
         int  daymatch = i;
            
            NSLog(@"daymatch --- %d",i);
            
            if (daymatch == 0) {
                
                [_Day_Label setText:@"01"];
                
            }
            
            
            [_Day setSelectedItemIndex:daymatch];
            
        }
        
    }

    
    //Set Current Year
    
    for(int i=0; i < [YearLoad count]; i++) {
        
        NSString *compyear = [YearLoad objectAtIndex:i];
        
        if ([year isEqualToString:compyear]) {
            
            int  yearmatch = i;
            
            NSLog(@"yearmatch --- %d",i);
            
            if (yearmatch == 0) {
                
                [_Year_Label setText:@"2015"];
                
            }
            
            [_Year setSelectedItemIndex:yearmatch];
            
        }
        
    }
    

    getTotalDate = [NSString stringWithFormat:@"%@/%@/%@",month,day,year];
    
    NSLog(@"OUTPUT %@",getTotalDate);
    
    [_DateButton setTitle:getTotalDate];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)Month_Action:(NSInteger)value {
    
    WKPickerItem *month = MonthArray[value];
    
    NSLog(@"NOW THE MONTH value is %ld",(long)value);
    
    NSLog(@"month title %@",month.title);
  
    for(int i=0; i < [MonthNumLoad count]; i++) {
         
        NSString *getall = [MonthNumLoad objectAtIndex:i];
         
         if (value == i) {
             
             [_Month_Label setText:getall];
             
             getMonth = getall;
             
             getTotalDate = [NSString stringWithFormat:@"%@/%@/%@",getMonth,getDay,getYear];
             
             NSLog(@"OUTPUT /Month -  %@",getTotalDate);
             
             [_DateButton setTitle:getTotalDate];
         }
         
     }
    
    
    
    
}

- (IBAction)Day_Action:(NSInteger)value {
    
    WKPickerItem *day = DayArray[value];
    
    [_Day_Label setText:day.title];
    
        NSLog(@"day title %@",day.title);
    
    getDay = day.title;
    
    getTotalDate = [NSString stringWithFormat:@"%@/%@/%@",getMonth,getDay,getYear];
    
    NSLog(@"OUTPUT /Day - %@",getTotalDate);
    
    [_DateButton setTitle:getTotalDate];

}

- (IBAction)Year_Action:(NSInteger)value {
    
    WKPickerItem *year = YearArray[value];
    
    [_Year_Label setText:year.title];
    
       NSLog(@"Year title %@",year.title);
    
    getYear = year.title;
    
    getTotalDate = [NSString stringWithFormat:@"%@/%@/%@",getMonth,getDay,getYear];
    
    NSLog(@"OUTPUT /Year -  %@",getTotalDate);
    
    [_DateButton setTitle:getTotalDate];

}


- (IBAction)DateAction {
    
    NSLog(@"Button %@",getTotalDate);
    
    
}
@end



