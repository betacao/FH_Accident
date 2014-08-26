/**
 * Copyright (c) 2009 Alex Fajkowski, Apparent Logic LLC
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
#import "UIImageExtras.h"


@implementation UIImage (OpenFlowExtras)

+(UIImage *)imageWithName:(NSString *)name
{
	if ([name length] == 0) {
		return nil;
	}
	NSString *fileName = name;
	CGRect screenBounds = [[UIScreen mainScreen] bounds];
	if (screenBounds.size.height == 568.0f) {
		fileName = [name stringByAppendingFormat:@"-568"];
	}
	
	return [UIImage imageNamed:fileName];
}

+(UIImage *)scaledImageWisorg:(UIImage *)img originFileSize:(long long)orgSize
{
	UIImage *scaledImage = img;
	long long len = orgSize;
	if (len  == 0) {
		NSData *data = UIImagePNGRepresentation(scaledImage);
		len = [data length];
	}
//	CGFloat sizeAllowed = 512000.0f;	//wifi下，大于500K的图片将进行压缩
//	Reachability *reach = [Reachability reachabilityForInternetConnection];
//	NetworkStatus status = [reach currentReachabilityStatus];
//	if (status != kReachableViaWiFi) {
//		sizeAllowed = 204800.0f;	//非wifi下，大于200K的图片将进行压缩
//	}
	CGFloat sizeAllowed = 204800.0f;	//
	
	static CGFloat contrain = 800.0f;
	if (len > sizeAllowed) {
		CGFloat ratio = scaledImage.size.height / scaledImage.size.width;
		CGFloat scaling = 1.0f;
		if (ratio >= 1.0f) {
			if (scaledImage.size.width > contrain) {
				scaling = contrain / scaledImage.size.width;
			}
		} else {
			if (scaledImage.size.height > contrain) {
				scaling = contrain / scaledImage.size.height;
			}
		}
		if (scaling != 1.0f) {
			CGRect rect = CGRectMake(0.0, 0.0, scaledImage.size.width * scaling, scaledImage.size.height * scaling);
			UIGraphicsBeginImageContext(rect.size);
			[scaledImage drawInRect:rect];
			scaledImage = UIGraphicsGetImageFromCurrentImageContext();
			UIGraphicsEndImageContext();
		}
		NSData *data = UIImageJPEGRepresentation(scaledImage, kImageCompressRate);
		scaledImage = [UIImage imageWithData:data];
	} 
	return scaledImage;
}
+(NSData *)scaledImageDataWisorg:(UIImage *)img originFileSize:(long long)orgSize
{
	UIImage *scaledImage = img;
	long long len = orgSize;
	if (len  == 0) {
		NSData *data = UIImagePNGRepresentation(scaledImage);
		len = [data length];
	}
	//	CGFloat sizeAllowed = 512000.0f;	//wifi下，大于500K的图片将进行压缩
	//	Reachability *reach = [Reachability reachabilityForInternetConnection];
	//	NetworkStatus status = [reach currentReachabilityStatus];
	//	if (status != kReachableViaWiFi) {
	//		sizeAllowed = 204800.0f;	//非wifi下，大于200K的图片将进行压缩
	//	}
	CGFloat sizeAllowed = 204800.0f;	//
	
	static CGFloat contrain = 800.0f;
	if (len > sizeAllowed) {
		CGFloat ratio = scaledImage.size.height / scaledImage.size.width;
		CGFloat scaling = 1.0f;
		if (ratio >= 1.0f) {
			if (scaledImage.size.width > contrain) {
				scaling = contrain / scaledImage.size.width;
			}
		} else {
			if (scaledImage.size.height > contrain) {
				scaling = contrain / scaledImage.size.height;
			}
		}
		if (scaling != 1.0f) {
			CGRect rect = CGRectMake(0.0, 0.0, scaledImage.size.width * scaling, scaledImage.size.height * scaling);
			UIGraphicsBeginImageContext(rect.size);
			[scaledImage drawInRect:rect];
			scaledImage = UIGraphicsGetImageFromCurrentImageContext();
			UIGraphicsEndImageContext();
		}
		return UIImageJPEGRepresentation(scaledImage, 0.3f);;
	} else {
		return UIImageJPEGRepresentation(scaledImage, 0.3f);
	}
}

- (UIImage *)rescaleImageToSize:(CGSize)size {
	CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
	UIGraphicsBeginImageContext(rect.size);
	[self drawInRect:rect];  // scales image to rect
	UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return resImage;
}

- (UIImage *)cropImageToRect:(CGRect)cropRect {
	// Begin the drawing (again)
	UIGraphicsBeginImageContext(cropRect.size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	// Tanslate and scale upside-down to compensate for Quartz's inverted coordinate system
	CGContextTranslateCTM(ctx, 0.0, cropRect.size.height);
	CGContextScaleCTM(ctx, 1.0, -1.0);
	
	// Draw view into context
	CGRect drawRect = CGRectMake(-cropRect.origin.x, cropRect.origin.y - (self.size.height - cropRect.size.height) , self.size.width, self.size.height);
	CGContextDrawImage(ctx, drawRect, self.CGImage);
	
	// Create the new UIImage from the context
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	
	// End the drawing
	UIGraphicsEndImageContext();
	
	return newImage;
}

- (CGSize)calculateNewSizeForCroppingBox:(CGSize)croppingBox {
	// Make the shortest side be equivalent to the cropping box.
	CGFloat newHeight, newWidth;
	if (self.size.width < self.size.height) {
		newWidth = croppingBox.width;
		newHeight = (self.size.height / self.size.width) * croppingBox.width;
	} else {
		newHeight = croppingBox.height;
		newWidth = (self.size.width / self.size.height) *croppingBox.height;
	}
	return CGSizeMake(newWidth, newHeight);
}

- (UIImage *)cropCenterAndScaleImageToSize:(CGSize)cropSize {
	UIImage *scaledImage = [self rescaleImageToSize:[self calculateNewSizeForCroppingBox:cropSize]];
	return [scaledImage cropImageToRect:CGRectMake((scaledImage.size.width-cropSize.width)/2, (scaledImage.size.height-cropSize.height)/2, cropSize.width, cropSize.height)];
}

-(UIImage *)scaleImageDown:(CGSize)scaleSize{
	CGSize imageSize = self.size;
	CGSize caledImageSize;
	if (imageSize.width>scaleSize.width&&imageSize.height>scaleSize.width) {
		CGFloat containerRatio = scaleSize.width/scaleSize.height;
		CGFloat imageRatio = imageSize.width/imageSize.height;
		if (imageRatio>containerRatio) {
			//采用container的width
			CGFloat displayedHeight = scaleSize.width*imageSize.height/imageSize.width;
			caledImageSize = CGSizeMake(scaleSize.width, displayedHeight);
		}else{
			//采用container的height
			CGFloat displayedWidth = scaleSize.height*imageSize.width/imageSize.height;
			caledImageSize = CGSizeMake(displayedWidth, scaleSize.height);
		}
	}else if(imageSize.width>scaleSize.width){
		CGFloat displayedHeight = scaleSize.width*imageSize.height/imageSize.width;
		caledImageSize = CGSizeMake(scaleSize.width, displayedHeight);
	}else if(imageSize.height>scaleSize.height){
		CGFloat displayedWidth = scaleSize.height*imageSize.width/imageSize.height;
		caledImageSize = CGSizeMake(displayedWidth, scaleSize.height);
	}else{
		caledImageSize = CGSizeMake(imageSize.width, imageSize.height);
	}
	return [self rescaleImageToSize:caledImageSize];
}

-(UIImage*)cropCenterAndScaleImageToSize2:(CGSize)cropSize{
    CGFloat cropRatio = cropSize.width/cropSize.height;
    CGFloat imageRatio = self.size.width/self.size.height;
//    NSLog(@"cropRatio:%f,imageRatio:%f",cropRatio,imageRatio);
    CGSize newSize;
    if (cropRatio<imageRatio) {
        newSize = CGSizeMake(cropSize.width, (cropSize.width/self.size.width)*self.size.height);
    }else {
        newSize = CGSizeMake((cropSize.height/self.size.height)*self.size.width, cropSize.height);
    }
    UIImage *scaledImage = [self rescaleImageToSize:newSize];
    return [scaledImage cropImageToRect:CGRectMake(0, 0, cropSize.width, cropSize.height)];
}

-(float) getScaleRange
{
    UIScreen *screen = [UIScreen mainScreen];
    CGSize size = screen.bounds.size;
    int  width   = (int)screen.scale * size.width;
    int  height  = (int)screen.scale * size.height-(int)screen.scale*64;
    
    float ratio=480/320;
    float originRatio=self.size.height/self.size.width;
    
    //窄图
    if(originRatio>=ratio)
    {
        int newWidth=height*self.size.width/self.size.height;
        return  (float)width/newWidth;
        
    }
    //宽图
    else {
        int newHeight=self.size.height*width/self.size.width; 
        return  (float)height/newHeight;
    }
    
}

-(UIViewContentMode) getShowMode
{
    UIScreen *screen = [UIScreen mainScreen];
    CGSize size = screen.bounds.size;
    int  width   = (int)screen.scale * size.width;
    int  height  = (int)screen.scale * size.height;

    
    if (self.size.height<=height&&self.size.width<=width) {
        
        return  UIViewContentModeCenter;
    }
    else {
        return  UIViewContentModeScaleAspectFit;
    }
}
@end