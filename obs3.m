clc;
clear all;
close all;
sgtitle("17ucc038");
x = imread('cameraman.tif');
b=8;
for i=1:b:256
    for j=1:b:256
        image = x(i:i+7,j:j+7);
        y=dct2(image);
        for b=1:4
            for c=3:8
                y(b,c)=0;
            end
        end
        
        for b=5:8
            for c=1:8
                y(b,c)=0;
            end
        end
        z = idct2(y);
        r(i:i+7,j:j+7) = z;
    end
end
subplot(2,2,1);
imshow(uint8(r));
title("reconstructed s/g for 8");
imwrite(uint8(r),'8.jpg');
mse1= mse((x-uint8(r)));
com1 = 1/8;

for i=1:b:256
    for j=1:b:256
        image = x(i:i+7,j:j+7);
        y=dct2(image);
        for b=1:4
            for c=5:8
                y(b,c)=0;
            end
        end
        
        for b=5:8
            for c=1:8
                y(b,c)=0;
            end
        end
        z = idct2(y);
        r(i:i+7,j:j+7) = z;
    end
end

subplot(2,2,2);
imshow(uint8(r));
title("reconstructed s/g for 16");
imwrite(uint8(r),'16.jpg');
mse2= mse((x-uint8(r)));
com2 = 1/4;

for i=1:b:256
    for j=1:b:256
        image = x(i:i+7,j:j+7);
        y=dct2(image);
       
        
        for b=5:8
            for c=1:8
                y(b,c)=0;
            end
        end
        z = idct2(y);
        r(i:i+7,j:j+7) = z;
    end
end

subplot(2,2,3);
imshow(uint8(r));
title("reconstructed s/g for 32");
imwrite(uint8(r),'32.jpg');
mse3= mse((x-uint8(r)));
com3 = 1/2;


for i=1:b:256
    for j=1:b:256
        image = x(i:i+7,j:j+7);
        y=dct2(image);
       
        
        for b=5:8
            for c=5:8
                y(b,c)=0;
            end
        end
        z = idct2(y);
        r(i:i+7,j:j+7) = z;
    end
end

subplot(2,2,4);
imshow(uint8(r));
title("reconstructed s/g for 48");
imwrite(uint8(r),'48.jpg');
mse4= mse((x-uint8(r)));
com4 = 0.75;


figure;
msee = [mse1 mse2 mse3 mse4];
comm = [com1 com2 com3 com4];
stem(msee,comm);
title("17ucc038|mse vs compression ratio");
xlabel("mse");
ylabel("compression ratio");






