% SCRIPT_SSDB_ExtractObjectCrops.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bileschi 2007
%%%
% selects positive and negative object examples and writes the extracted crops
% to the disk

clear all
cd /cbcl/scratch03/bileschi/Release/code2
% Control Parameters
% >>>>>>>>>>>>> EDIT TO MATCH YOUR CONFIGURATION <<<<<<<<<<<<<<<
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DefaultControlParams.SSDB_ImagePath = '/cbcl/scratch01/scratch02/imageDatasets/StreetScenes/images';
DefaultControlParams.SSDB_AnnoPath = '/cbcl/scratch01/scratch02/imageDatasets/StreetScenes/Labels';
DefaultControlParams.ObjectName= 'car';
DefaultControlParams.NegsPerPos = 1;
DefaultControlParams.SavePath = '~/Temp';
ControlParams = [];
ControlParams = ResolveMissingOptions(ControlParams,DefaultControlParams);

% Load data hooks 
%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('getting SSDB file names (takes a minute): ');
CAfilelist = SSDB_ListFiles(ControlParams.SSDB_ImagePath,ControlParams.SSDB_AnnoPath);
fprintf('done\n');
% Select _positive_ bounding boxes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('getting locations of target object ');
[pBBoxs,pIdxs] = SSDB_BoundingBoxesPositive(1:3547,ControlParams.ObjectName,CAfilelist);
fprintf('done\n');
% Use the positive bounding boxes as a distribution from which to choose _negative_ boxes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nBBoxs,nIdxs] = SSDB_BoundingBoxesNegative(pBBoxs,pIdxs, 1:3547,ControlParams.ObjectName,CAfilelist,ControlParams);
% intermediate save, uncomment if you want to save the box locations
 saveNameBBoxs = sprintf('bbox_%s.mat',ControlParams.ObjectName);
 save(fullfile(DefaultControlParams.SavePath,saveNameBBoxs),'pBBoxs','pIdxs','nBBoxs','nIdxs');
 load(fullfile(DefaultControlParams.SavePath,saveNameBBoxs)); %--> 'pBBoxs','pIdxs','nBBoxs','nIdxs'

%%% If uncommented this will draw a box around the first selected object
% im = imread(CAfilelist{1}.imagename);
% OrangeBox(bboxRelative2Real(pBBoxs(1,:),size(im)))
%

% Extract the selected bounding boxes 
SSDB_EBC_options = [];
SSDB_ExtractBBoxCrops(pBBoxs,pIdxs,nBBoxs,nIdxs,CAfilelist,SSDB_EBC_options);


