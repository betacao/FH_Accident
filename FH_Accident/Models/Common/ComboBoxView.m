//
//  ComboBoxView.m
//  comboBox
//
//  Created by duansong on 10-7-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ComboBoxView.h"


@implementation ComboBoxView

@synthesize comboBoxDatasource = _comboBoxDatasource;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.clipsToBounds = YES;
        initFrame = frame;
        _hideAfterSelect = YES;
		[self initVariables];
		[self initCompentWithFrame:frame];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 0.5;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setComboBoxDatasource:(NSArray *)comboBoxDatasource
{
    [_comboBoxDatasource release];
    _comboBoxDatasource = [comboBoxDatasource retain];
    //[_comboBoxTableView reloadData];
}

- (void)initVariables
{
	_showComboBox = NO;
}

- (void)initCompentWithFrame:(CGRect)frame
{
	_comboBoxTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [_comboBoxTableView custom];
	_comboBoxTableView.dataSource = self;
	_comboBoxTableView.delegate = self;
	_comboBoxTableView.backgroundColor = [UIColor clearColor];
    _comboBoxTableView.bounces = NO;
	[self addSubview:_comboBoxTableView];
    
    //初始为隐藏
    CGRect rect = initFrame;
    rect.size.height = 0.0f;
    self.frame = rect;
}
- (void)hitComboBox
{
    if (_showComboBox)
    {
        [self hidden];
    }
    else
    {
        [self show];
    }
}

- (BOOL)isShow
{
    return _showComboBox;
}
- (void)show
{
	_showComboBox = YES;
    
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.frame = initFrame;
                     } completion:^(BOOL finished){
                     
                         if (_delegate && [_delegate respondsToSelector:@selector(comboBoxDidShow:)])
                         {
                             [_delegate comboBoxDidShow:self];
                         }
                     }];
}

- (void)hidden
{
	_showComboBox = NO;
    
    [UIView animateWithDuration:0.15
                     animations:^{
                         CGRect rect = initFrame;
                         rect.size.height = 0.0f;
                         self.frame = rect;
                         
                     }completion:^(BOOL finished){
                         
                         if (_delegate && [_delegate respondsToSelector:@selector(comboBoxdidHide:)])
                         {
                             [_delegate comboBoxdidHide:self];
                         }
                     }];
}

#pragma mark -
#pragma mark UITableViewDelegate and UITableViewDatasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_comboBoxDatasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"ListCellIdentifier";
	UITableViewCell *cell = [_comboBoxTableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
    {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	NSString *value = (NSString *)[_comboBoxDatasource objectAtIndex:indexPath.row];
    cell.textLabel.text = value;
	cell.textLabel.font = [UIFont systemFontOfSize:13.0f];
	if ([value isEqualToString:self.selectedValue])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 40.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (_hideAfterSelect)
    {
        [self hidden];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(comboBoxDidSelect:)])
    {
        NSString *value = [_comboBoxDatasource objectAtIndex:indexPath.row];
        self.selectedValue = value;
        [tableView reloadData];
        [_delegate comboBoxDidSelect:value];
    }
}
#pragma mark -
#pragma mark dealloc memery methods

- (void)dealloc
{
	_comboBoxTableView.delegate = nil;
	_comboBoxTableView.dataSource = nil;
    [_comboBoxTableView release],_comboBoxTableView = nil;
	
	[_comboBoxDatasource release];
	_comboBoxDatasource = nil;
	
    [_selectedValue release],_selectedValue = nil;
    [super dealloc];
}


@end
