/*
 * Copyright (c) 2014 Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "RuleManagement.h"
#import "HttpRequestOperation.h"
#import "HttpResponseMacros.h"
#define TAG @"RuleManagement"
#define STATUS @"status"
#define DESCRIPTION @"description"
#define PRIORITY @"priority"
#define TYPE @"type"
#define RESETTYPE @"resetType"
#define TARGET @"target"
#define ACTIONS @"actions"
#define IDS @"ids"
#define CONDITIONS @"conditions"
#define OPERATOR @"operator"
#define VALUES @"values"
#define COMPONENT @"component"
#define DATATYPE @"dataType"
#define POPULATION @"population"

//#####CreateRule#######
@interface CreateRule ()

@property (nonatomic,retain)NSString* name;
@property (nonatomic,retain)NSString* ruleDescription;
@property (nonatomic,retain)NSString* priority;
@property (nonatomic,retain)NSString* ruleType;
@property (nonatomic,retain)NSString* status;
@property (nonatomic,retain)NSString* resetType;
@property (nonatomic,retain)NSMutableArray* ruleActionsList;
// population
@property (nonatomic,retain)NSMutableArray* populationIds;
@property (nonatomic,retain)NSString* populationAttributes;
//conditions
@property (nonatomic,retain)NSString* operatorName;
@property (nonatomic,retain)NSMutableArray* ruleConditionValuesList;

@end

@implementation CreateRule
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleName
 *
 * DESCRIPTION: sets rule Name
 *
 * RETURNS: nothing
 *
 * PARAMETERS : ruleName
 **************************************************************************************************************************/
-(void)setRuleName:(NSString*)ruleName{
    _name = ruleName;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleDescription
 *
 * DESCRIPTION: sets rule Description
 *
 * RETURNS: nothing
 *
 * PARAMETERS : description
 **************************************************************************************************************************/
-(void)setRuleDescription:(NSString*)description{
    _ruleDescription = description;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRulePriority
 *
 * DESCRIPTION: sets rule priority
 *
 * RETURNS: nothing
 *
 * PARAMETERS : priority
 **************************************************************************************************************************/
-(void)setRulePriority:(NSString*)priority{
    _priority = priority;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleType
 *
 * DESCRIPTION: sets type of rule
 *
 * RETURNS: nothing
 *
 * PARAMETERS : ruleType
 **************************************************************************************************************************/
-(void)setRuleType:(NSString*)ruleType{
    _ruleType = ruleType;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleStatus
 *
 * DESCRIPTION: sets status of rule
 *
 * RETURNS: nothing
 *
 * PARAMETERS : status
 **************************************************************************************************************************/
-(void)setRuleStatus:(NSString*)status{
    self.status = status;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleResetType
 *
 * DESCRIPTION: sets resetType of rule
 *
 * RETURNS: nothing
 *
 * PARAMETERS : resetType
 **************************************************************************************************************************/
-(void)setRuleResetType:(NSString*)resetType{
    _resetType = resetType;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRulePopulationAttributes
 *
 * DESCRIPTION: sets population attributes on rule
 *
 * RETURNS: nothing
 *
 * PARAMETERS : attributes
 **************************************************************************************************************************/
-(void)setRulePopulationAttributes:(NSString*)attributes{
    _populationAttributes = attributes;
}
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleOperatorName
 *
 * DESCRIPTION: sets rule opeartor name
 *
 * RETURNS: nothing
 *
 * PARAMETERS : opeartor name
 **************************************************************************************************************************/
-(void)setRuleOperatorName:(NSString*)operatorName{
    _operatorName = operatorName;
}
/***************************************************************************************************************************
 * FUNCTION NAME: addRuleActions
 *
 * DESCRIPTION: adds rule action object to rule action list
 *
 * RETURNS: nothing
 *
 * PARAMETERS : rule action object
 **************************************************************************************************************************/
-(void)addRuleActions:(CreateRuleActions*)createRuleActionsObj{
    if(!_ruleActionsList){
        _ruleActionsList = [NSMutableArray array];
    }
    [_ruleActionsList addObject:createRuleActionsObj];
}
/***************************************************************************************************************************
 * FUNCTION NAME: addRulePopulationId
 *
 * DESCRIPTION: append population Id's to lsit of Id's
 *
 * RETURNS: nothing
 *
 * PARAMETERS : populationId **************************************************************************************************************************/
-(void)addRulePopulationId:(NSString*)populationId{
    if(!_populationIds){
        _populationIds = [NSMutableArray array];
    }
    [_populationIds addObject:populationId];
}
/***************************************************************************************************************************
 * FUNCTION NAME: addRuleConditionValues
 *
 * DESCRIPTION: append condition value obj to list of conditions
 *
 * RETURNS: nothing
 *
 * PARAMETERS : rule condition values object **************************************************************************************************************************/
-(void)addRuleConditionValues:(CreateRuleConditionValues*)createRuleConditionValuesObj{
    if(!_ruleConditionValuesList){
        _ruleConditionValuesList = [NSMutableArray array];
    }
    [_ruleConditionValuesList addObject:createRuleConditionValuesObj];
}

@end


//#####CreateRuleActions#######
@interface CreateRuleActions ()

@property (nonatomic,retain)NSString* ruleActionType;
@property (nonatomic,retain)NSMutableArray* targetList;

@end


@implementation CreateRuleActions
/***************************************************************************************************************************
 * FUNCTION NAME: setRuleActionType
 *
 * DESCRIPTION: sets action type on rule
 *
 * RETURNS: nothing
 *
 * PARAMETERS : action type
 **************************************************************************************************************************/
-(void)setRuleActionType:(NSString*)ruleActionType{
    _ruleActionType = ruleActionType;
}
/***************************************************************************************************************************
 * FUNCTION NAME: addRuleActionTarget
 *
 * DESCRIPTION: append rule target type to list of targets
 *
 * RETURNS: nothing
 *
 * PARAMETERS : target **************************************************************************************************************************/
-(void)addRuleActionTarget:(NSString*)target{
    if(!_targetList){
        _targetList = [NSMutableArray array];
    }
    [_targetList addObject:target];
}

@end

//#####CreateRuleConditionValues#######
@interface CreateRuleConditionValues ()

@property (nonatomic,retain)NSMutableDictionary* component;
@property (nonatomic,retain)NSString* ruleConditionType;
@property (nonatomic,retain)NSMutableArray* values;
@property (nonatomic,retain)NSString* ruleConditionValuesOperatorName;

@end


@implementation CreateRuleConditionValues
/***************************************************************************************************************************
 * FUNCTION NAME: addConditionComponentWithKey
 *
 * DESCRIPTION: append key-value pair to component list
 *
 * RETURNS: nothing
 *
 * PARAMETERS : 1)key
                2)Value
 **************************************************************************************************************************/
-(void)addConditionComponentWithKey:(NSString*)keyName AndValue:(NSString*)keyValue{
    if(!_component){
        _component = [NSMutableDictionary dictionary];
    }
    [_component setObject:keyValue forKey:keyName];
}
/***************************************************************************************************************************
 * FUNCTION NAME: setConditionType
 *
 * DESCRIPTION: sets rule condition type
 *
 * RETURNS: nothing
 *
 * PARAMETERS : ruleConditionType
 **************************************************************************************************************************/
-(void)setConditionType:(NSString*)ruleConditionType{
    _ruleConditionType = ruleConditionType;
}
/***************************************************************************************************************************
 * FUNCTION NAME: alertAddaddConditionValuesComponents
 *
 * DESCRIPTION: append condition value to the list of values
 *
 * RETURNS: nothing
 *
 * PARAMETERS : component object **************************************************************************************************************************/
-(void)addConditionValues:(NSString*)value{
    if(!_values){
        _values = [NSMutableArray array];
    }
    [_values addObject:value];
}
/***************************************************************************************************************************
 * FUNCTION NAME: setConditionOperator
 *
 * DESCRIPTION: sets condition operator
 *
 * RETURNS: nothing
 *
 * PARAMETERS : operator name
 **************************************************************************************************************************/
-(void)setConditionOperator:(NSString*)ruleConditionValuesOperatorName{
    _ruleConditionValuesOperatorName = ruleConditionValuesOperatorName;
}

@end


//#####RuleManagement#######
@implementation RuleManagement

/***************************************************************************************************************************
 * FUNCTION NAME: getListOfRules
 *
 * DESCRIPTION: requests list of rules
 *
 * RETURNS: true/false
 *
 * PARAMETERS : nil
 **************************************************************************************************************************/
-(BOOL)getListOfRules{
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.getListOfRules urlSlugValueList:nil];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:GETLISTOFRULES
                                                                     AndRequestBody:nil
                                                                  AndHttpMethodType:HTTPGET
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: getInformationOnRule
 *
 * DESCRIPTION: requests info of given rule id
 *
 * RETURNS: true/false
 *
 * PARAMETERS : ruleId
 **************************************************************************************************************************/
-(BOOL)getInformationOnRule:(NSString*)ruleId{
    if(!ruleId){
        NSLog(@"%@:Rule Id cannot be null",TAG);
        return false;
    }
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.getInfoOfRule urlSlugValueList:[NSDictionary dictionaryWithObject:ruleId forKey:RULEID]];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:GETINFOOFRULE
                                                                     AndRequestBody:nil
                                                                  AndHttpMethodType:HTTPGET
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: deleteADraftRule
 *
 * DESCRIPTION: requests delete of given rule id
 *
 * RETURNS: true/false
 *
 * PARAMETERS : ruleId
 **************************************************************************************************************************/
-(BOOL)deleteADraftRule:(NSString*)ruleId{
    if(!ruleId){
        NSLog(@"%@:Rule Id cannot be null",TAG);
        return false;
    }
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.deleteDraftRule urlSlugValueList:[NSDictionary dictionaryWithObject:ruleId forKey:RULEID]];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:DELETEDRAFTRULE
                                                                     AndRequestBody:nil
                                                                  AndHttpMethodType:HTTPDELETE
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: updateStatusOfRule
 *
 * DESCRIPTION: requests status update of given rule id with given status
 *
 * RETURNS: true/false
 *
 * PARAMETERS : 1)ruleId
                2)status
 **************************************************************************************************************************/
-(BOOL)updateStatusOfRule:(NSString*)ruleId WithStatus:(NSString*)status{
    if(!ruleId || !status){
        NSLog(@"%@:Rule Id or status cannot be null",TAG);
        return false;
    }
    NSData *data = [self createHttpBodyToUpdateRuleStatus:status];
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.updateStatusOfRule urlSlugValueList:[NSDictionary dictionaryWithObject:ruleId forKey:RULEID]];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:UPDATESTATUSOFRULE
                                                                     AndRequestBody:data
                                                                  AndHttpMethodType:HTTPPUT
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: createRuleAsDraftUsing
 *
 * DESCRIPTION: requests creation of draft rule using given rule Name
 *
 * RETURNS: true/false
 *
 * PARAMETERS : ruleName
 **************************************************************************************************************************/
-(BOOL)createRuleAsDraftUsing:(NSString*)ruleName{
    if(!ruleName){
        NSLog(@"%@:Rule name cannot be null",TAG);
        return false;
    }
    NSData *data = [self createHttpBodyToCreateRuleAsDraft:ruleName];
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.createRuleAsDraft urlSlugValueList:nil];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:CREATERULEASDRAFT
                                                                     AndRequestBody:data
                                                                  AndHttpMethodType:HTTPPUT
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: createRule
 *
 * DESCRIPTION: requests to create a rule
 *
 * RETURNS: true/false
 *
 * PARAMETERS : create rule object
 **************************************************************************************************************************/
-(BOOL)createRule:(CreateRule*)createRuleObj{
    if(!createRuleObj){
        NSLog(@"%@:create rule object cannot null",TAG);
        return false;
    }
    NSData *data = [self createHttpBodyToCreateRule:createRuleObj];
    NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.createRule urlSlugValueList:nil];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:CREATERULE
                                                                     AndRequestBody:data
                                                                  AndHttpMethodType:HTTPPOST
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: updateARule
 *
 * DESCRIPTION: requests update of given ruleId
 *
 * RETURNS: true/false
 *
 * PARAMETERS : 1)updateRule object
                2)ruleId
 **************************************************************************************************************************/
-(BOOL)updateARule:(CreateRule *)updateRuleObj OnRule:(NSString *)ruleId{
    if(!updateRuleObj || !ruleId){
        NSLog(@"%@:create rule object or rule Id cannot null",TAG);
        return false;
    }
    NSData *data = [self createHttpBodyToCreateRule:updateRuleObj];
    NSString *url = [self.objHttpUrlBuilder prepareUrlByAppendingUrl:self.objHttpUrlBuilder.updateRule urlSlugValueList:[NSDictionary dictionaryWithObject:ruleId forKey:RULEID]];
    HttpRequestOperation *httpOperation = [[HttpRequestOperation alloc] initWithUrl:url
                                                                        onOperation:UPDATERULE
                                                                     AndRequestBody:data
                                                                  AndHttpMethodType:HTTPPUT
                                                                     AndContentType:CONTENTTYPEJSON
                                                                          AuthToken:self.getStoredAuthToken
                                                                        DeviceToken:nil];
    return [self initiateHttpOperation:httpOperation];
}
/***************************************************************************************************************************
 * FUNCTION NAME: createHttpBodyToCreateRule
 *
 * DESCRIPTION: method to create http Body to create rule
 *
 * RETURNS: data stream of request body
 *
 * PARAMETERS : create rule object
 **************************************************************************************************************************/
-(NSData*)createHttpBodyToCreateRule:(CreateRule*)createRuleObj{
    
    NSMutableDictionary *createRuleDictionary = [NSMutableDictionary dictionary];
    [createRuleDictionary setObject:createRuleObj.name forKey:NAME];
    [createRuleDictionary setObject:createRuleObj.ruleDescription forKey:DESCRIPTION];
    [createRuleDictionary setObject:createRuleObj.priority forKey:PRIORITY];
    [createRuleDictionary setObject:createRuleObj.ruleType forKey:TYPE];
    [createRuleDictionary setObject:createRuleObj.status forKey:STATUS];
    [createRuleDictionary setObject:createRuleObj.resetType forKey:RESETTYPE];
    //adding actions
    NSMutableArray *ruleActionsArray = [NSMutableArray array];
    for(CreateRuleActions *createRuleActionsObj in createRuleObj.ruleActionsList){
        NSDictionary *actionDictionary = [NSDictionary dictionaryWithObjectsAndKeys:createRuleActionsObj.ruleActionType,TYPE,createRuleActionsObj.targetList,TARGET, nil];
        [ruleActionsArray addObject:actionDictionary];
    }
    [createRuleDictionary setObject:ruleActionsArray forKey:ACTIONS];
    NSDictionary *populationDictionary;
    //adding population
    if(!createRuleObj.populationAttributes){
        populationDictionary  = [NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],ATTRIBUTES,createRuleObj.populationIds,IDS,nil];
    }
    else{
        populationDictionary = [NSDictionary dictionaryWithObjectsAndKeys:createRuleObj.populationAttributes,ATTRIBUTES,createRuleObj.populationIds,IDS,nil];
    }
    [createRuleDictionary setObject:populationDictionary forKey:POPULATION];
    //adding conditions
    NSMutableDictionary *conditionsDictionary = [NSMutableDictionary dictionaryWithObject:createRuleObj.operatorName forKey:OPERATOR];
    NSMutableArray *valuesArray = [NSMutableArray array];
    for (CreateRuleConditionValues *createRuleConditionValuesObj in createRuleObj.ruleConditionValuesList) {
        NSDictionary *valuesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:createRuleConditionValuesObj.ruleConditionType,TYPE,createRuleConditionValuesObj.ruleConditionValuesOperatorName,OPERATOR,createRuleConditionValuesObj.values,VALUES,createRuleConditionValuesObj.component,COMPONENT,nil];
        [valuesArray addObject:valuesDictionary];
    }
    [conditionsDictionary setObject:valuesArray forKey:VALUES];
    [createRuleDictionary setObject:conditionsDictionary forKey:CONDITIONS];
    NSError *error;
    return [NSJSONSerialization dataWithJSONObject:createRuleDictionary options:NSJSONWritingPrettyPrinted
                                             error:&error];
}
/***************************************************************************************************************************
 * FUNCTION NAME: createHttpBodyToCreateRuleAsDraft
 *
 * DESCRIPTION: method to create http Body to create draft rule
 *
 * RETURNS: data stream of request body
 *
 * PARAMETERS : rule Name
 **************************************************************************************************************************/
-(NSData*)createHttpBodyToCreateRuleAsDraft:(NSString*)ruleName{
    NSDictionary *createDraftRuleJson = [NSDictionary dictionaryWithObjectsAndKeys:ruleName,NAME,nil];
    NSError *error;
    return [NSJSONSerialization dataWithJSONObject:createDraftRuleJson options:NSJSONWritingPrettyPrinted
                                             error:&error];
}
/***************************************************************************************************************************
 * FUNCTION NAME: createHttpBodyToUpdateRuleStatus
 *
 * DESCRIPTION: method to create http Body to update rule status
 *
 * RETURNS: data stream of request body
 *
 * PARAMETERS : status of rule
 **************************************************************************************************************************/
-(NSData*)createHttpBodyToUpdateRuleStatus:(NSString*)status{
    NSDictionary *ruleStatusJson = [NSDictionary dictionaryWithObjectsAndKeys:status,STATUS,nil];
    NSError *error;
    return [NSJSONSerialization dataWithJSONObject:ruleStatusJson options:NSJSONWritingPrettyPrinted
                                             error:&error];
}
@end