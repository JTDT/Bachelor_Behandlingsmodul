 function [img] = takeScreenDump()
%Inspireret af: https://www.youtube.com/watch?v=s19oD9bbU6U

%Tag screenshot
robot = java.awt.Robot(); 

%%%
t = java.awt.Toolkit.getDefaultToolkit();
rectangle = java.awt.Rectangle(t.getScreenSize()); 

%%%
%rectangle = java.awt.Rectangle(position(1),position(2),position(3),position(4));
capture = robot.createScreenCapture(rectangle); 

%Convert to an RBG image
%typecast(X,type)
rgbimage = typecast(capture.getRGB(0,0,capture.getWidth,capture.getHeight,[],0,capture.getWidth),'uint8');
img(:,:,1)=reshape(rgbimage(3:4:end),capture.getWidth,[])'; %specify a single dimension size of [] to have the dimension size automatically calculated
img(:,:,2)=reshape(rgbimage(2:4:end),capture.getWidth,[])';
img(:,:,3)=reshape(rgbimage(1:4:end),capture.getWidth,[])';
end 