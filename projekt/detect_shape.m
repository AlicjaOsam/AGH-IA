function [circles, squares, triangles] = detect_shape(binaryImage)
    figure
    imshow(binaryImage);
    hold on;
    
    [labeledImage, n] = bwlabel(binaryImage);
    
    stats = regionprops(labeledImage,...
        'Perimeter', 'FilledArea', 'Centroid');
    
    filledImage = imfill(binaryImage, 'holes');
    BW = bwboundaries(filledImage);
    
    perimeter = [stats.Perimeter];
    filledArea = [stats.FilledArea];
    
    circularity = perimeter .^2 ./ (4 * pi * filledArea);
    
    circles = 0;
    squares = 0;
    triangles = 0;
    
    for i = 1 : n
        hold on;
        
        for j = 1 : n
            b = BW{j};
            plot(b(:,2), b(:,1), 'b', 'LineWidth', 3);
        end

        if circularity(i) < 1.2
            shape = 'circle';
            circles = circles + 1;
        elseif circularity(i) < 1.5
            shape = 'square';
            squares = squares + 1;
        elseif circularity(i) > 1.5 && circularity(i) < 1.8
            shape = 'triangle';
            triangles = triangles + 1;
        else
            shape = 'unknown object';
        end
        
        overlayMessage = sprintf('%s', shape);
        text(stats(i).Centroid(1), stats(i).Centroid(2), ...
            overlayMessage, 'Color', 'r');
    end
end
