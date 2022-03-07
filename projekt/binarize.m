function binaryImage = binarize(ImageFile)
    grayImage = ImageFile(:,:,2);
    binaryImage = grayImage > 120;
    binaryImage = bwareaopen(binaryImage, 300);
end