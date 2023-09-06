%
movieback = zeros(height,width,data_length);
for i=1:data_length-1
qq = reshape(A4(:,i),[height,width]);
movieback(:,:,i) = qq;
end
%}
moviefront = zeros(height,width,data_length);
for i=1:data_length-1
qq = reshape(A5(:,i),height,width);
moviefront(:,:,i) = qq;
end

VidObj2 = VideoWriter('Background.avi', 'Uncompressed AVI'); 
VidObj2.FrameRate = size(data,2)/vidObj.duration; 
open(VidObj2);
for f = 1:size(movieback, 3)  
    writeVideo(VidObj2,mat2gray(movieback(:,:,f)));
end
close(VidObj2);

VidObj3 = VideoWriter('Foreground.avi', 'Uncompressed AVI'); 
VidObj3.FrameRate = size(data,2)/vidObj.duration; 
open(VidObj3);
for f = 1:size(moviefront, 3) 
    writeVideo(VidObj3,mat2gray(moviefront(:,:,f)));
end
close(VidObj3);