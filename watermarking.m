origImg = imread('Images/car.jpg');
figure,imshow(origImg);
title('Original Image');

waterSelect = input('\n\nSelect the text to be Watermarked :\n   Enter 1 for Watermark\n   Enter 2 for Draft\n   Enter 3 for Copyright', 's');
if isempty(waterSelect)
    waterSelect = '1';
elseif waterSelect == '1'
    fprintf('Text Selected is Watermark');
    waterImage = imread('Images/wmark.png');
elseif waterSelect == '2'
    fprintf('Text Selected is Draft');
    waterImage = imread('Images/draft.png');
elseif waterSelect == '3'
    fprintf('Text Selected is Copyright');
    waterImage = imread('Images/copy.png');
else
    fprintf('Incorrect input, Default Text Selected is Watermark');
    waterImage = imread('Images/wmark.png');
end

figure,imshow(waterImage);
title('Watermark Text Selected');
waterImage = imcomplement(waterImage);

showOp = input('Press the Enter key to show the Output Image');
figure,image(origImg);
title('Final Watermarked Image');
axis image;
hold on

textTransp = image(waterImage);
textTransp.AlphaData = max(waterImage,[],3);
hold off

F=getframe;
fileName = append(datestr(now,'HH:MM:SS'),'outImg.png');
path = append('Output/', fileName);
imwrite(F.cdata, path);
fprintf('\nThe Watermarked Image has been saved as %s in Output folder', fileName);