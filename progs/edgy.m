function edgedImg = edgy(img)
    sxf = [-1 0 1 ; -2 0 2 ; -1  0  1];
    syf = [ 1 2 1 ;  0 0 0 ; -1 -2 -1];
    for i = 2:size(img,1)-1
        for j = 2:size(img,2)-1
            A = double(img(i-1:i+1,j-1:j+1));
            sx = sum(sxf .* A ,'all');
            sy = sum(syf .* A ,'all');
            edgedImg(i-1,j-1) = uint8(sqrt(sx^2+sy^2));
        end
    end
end
%cc = imread('CocaCola.png');
%figure
%imshow(cc);
%edg = edgy(cc);
%figure
%imshow(edg);