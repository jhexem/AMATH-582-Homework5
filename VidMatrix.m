clear all;
vidObj = VideoReader('phi4.mov');
width = vidObj.width;
height = vidObj.height;
data_length = floor(vidObj.duration*vidObj.FrameRate);
data = zeros(width*height,data_length);
i = 1;
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    col = rgb2gray(im2double(vidFrame));
    col = col(:);
    data(:,i) = col;
    i = i+1;
end