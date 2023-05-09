%To get a clean a clean environment
clc
clear all
close all
warning off

%Loads webcam
vid=webcam("USB CAMERA");

%Stores dimensions and handle for distance textbox 
dim = [0.1 0.9 0.2 0];
handle = annotation('textbox',dim,'FitBoxToText','on','EdgeColor','black','Color','red');

while true
%  Get the snapshot of the current frame
    getdata=vid.snapshot;
% Calls two functions which contains the thresholding for both tags    
    redtag=RedMask(getdata);
    yellowtag=YellowMask(getdata);
% Perform morphological closing on tags.
    se= strel("disk",30);
    redtag=imclose(redtag,se); 
    yellowtag=imclose(yellowtag,se');
%Further Cleaning and Filtering of tags 
    redtag=rangefilt(redtag); 
    redtag=bwareaopen(redtag,500);
    redtag=bwareafilt(redtag,1);
    yellowtag=rangefilt(yellowtag); 
    yellowtag=bwareaopen(yellowtag,500);
    yellowtag=bwareafilt(yellowtag,1);
%Finding the centroids and boundaries around tag
    measurements1 = regionprops(redtag,'Centroid');
       [B,L] = bwboundaries(redtag,'noholes');
    measurements2 = regionprops(yellowtag,'Centroid');
       [B1,L1] = bwboundaries(yellowtag,'noholes');
    imshow(getdata);
    hold on;
%Annotate the video with boundary and centroid values  for red tag  
    for k = 1 : length(B)
        boundary = B{k};
        plot(boundary(:,2), boundary(:,1), 'c', 'LineWidth', 5)
        redcord = measurements1(k).Centroid;
        plot(redcord(1),redcord(2), 'g*','LineWidth',5);
        design1=text(redcord(1)+15,redcord(2), strcat('X: ', ...
            num2str(round(redcord(1))), '    Y: ', num2str(round(redcord(2)))));
        set(design1, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'black');
%Annotate the video with boundary and centroid values  for yellow tag        
        for k1 = 1 : length(B1)
             boundary = B1{k};
            plot(boundary(:,2), boundary(:,1), 'm', 'LineWidth', 5)
            yellowcord = measurements2(k1).Centroid;
            plot(yellowcord(1),yellowcord(2), 'r*','LineWidth',5);
            design2=text(yellowcord(1)+15,yellowcord(2), strcat('X: ', ...
                num2str(round(yellowcord(1))), '    Y: ', num2str(round(yellowcord(2)))));
            set(design2, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'black');
            plot([redcord(1),yellowcord(1)],[redcord(2),yellowcord(2)],'b','LineWidth',3);
%Calculation of distances
            dCityBlock = (abs(redcord(1) - yellowcord(1))) + (abs(redcord(2) - yellowcord(2)));
            dChessboard = max(abs(redcord(1) - yellowcord(1)), abs(redcord(2) - yellowcord(2)));
            dEuclidean = sqrt((redcord(1) - yellowcord(1))^2 + redcord(2) - yellowcord(2)^2);
%Annotates the video with distance calculation  
            str = {['City Block Distance = ',num2str(dCityBlock)],...
                   ['Chessboard Distance = ',num2str(dChessboard)],...
                   ['Euclidean Distance = ',num2str(dEuclidean)]};...
            handle.String = str;
        end 
    end 
    drawnow;
    hold off;
end 





