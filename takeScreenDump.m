function [img] = takeScreenDump()
%The function uses the Java awt robot to take a rectangular screenshot of the screen, when the user press the Save button in SaveDialogApp
%img = the image of the screen capture, which the funtion returns 
%Inspired by: https://www.youtube.com/watch?v=s19oD9bbU6U

%Get screencapture
robot = java.awt.Robot(); 
t = java.awt.Toolkit.getDefaultToolkit();
rectangle = java.awt.Rectangle(t.getScreenSize()); 
capture = robot.createScreenCapture(rectangle); 

%Convert to an RBG image
%typecast(X,type)
rgbimage = typecast(capture.getRGB(0,0,capture.getWidth,capture.getHeight,[],0,capture.getWidth),'uint8');
img(:,:,1)=reshape(rgbimage(3:4:end),capture.getWidth,[])'; %specify a single dimension size of [] to have the dimension size automatically calculated
img(:,:,2)=reshape(rgbimage(2:4:end),capture.getWidth,[])';
img(:,:,3)=reshape(rgbimage(1:4:end),capture.getWidth,[])';
end 