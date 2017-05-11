function SSDB_ExtractBBoxCrops(pBBoxs,pIdxs,nBBoxs,nIdxs,CAfilelist,options);
%function SSDB_ExtractBBoxCrops(pBBoxs,pIdxs,nBBoxs,nIdxs,CAfilelist);
%

if(nargin < 6),  options = [];, end
% Control Parameters
% >>>>>>>>>>>>> EDIT TO MATCH YOUR CONFIGURATION <<<<<<<<<<<<<<<
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DefaultOptions.MaxFractionSize = 1000; % how many samples will be saved in each file
DefaultOptions.SaveResolution = [128 128]; % All samples will be saved at this size
     % where to put the output
DefaultOptions.SaveRoot = '~/Temp';
DefaultOptions.Verbose = 1;
DefaultOptions.SaveFileTag = 'CropData_128x128_car';
options = ResolveMissingOptions(options,DefaultOptions);

%sort the positve and negative set to speed the extraction process
pBBoxs = round(pBBoxs);
nBBoxs = round(nBBoxs);
pYs = ones(1,length(pIdxs));
nYs = -ones(1,length(nIdxs));
[pi,psi] = sort(pIdxs);
pBBoxs = pBBoxs(psi,:);
pIdxs = pIdxs(psi);
pYs = pYs(psi);
[ni,nsi] = sort(nIdxs);
nBBoxs = nBBoxs(nsi,:);
nIdxs = nIdxs(nsi);
nYs = nYs(nsi);

grayX = [];
y= [];
myBBox = [];
myIdx = [];
previm = -1;
SAVE_BLOCK_NUMBER = 1;

% EXTRACT POSITIVE CROPS
% for every bounding box
for i = 1:length(pIdxs)
   imidx = pIdxs(i);
   % if necessary, load the image
   if(imidx ~= previm);
      im = imread(CAfilelist{imidx}.imagename);
      previm = imidx;
   end
   % crop, remoce color, and resize the sample
   gray_cr = imresize(rgb2gray(imcrop_pad(im,pBBoxs(i,:),'symmetric')),options.SaveResolution,'bilinear');
   grayX(:,end+1) = gray_cr(:);
   % these following variables record the crop info relative to the save block
   y(end+1) = pYs(i);
   myBBox((end+1),:) = pBBoxs(i,:);
   myIdx((end+1)) = pIdxs(i);
   fprintf('.');
   if(mod(i,50)==0) && (options.Verbose)
     fprintf('%d of %d positives\n',i,length(pIdxs));
   end
   if(size(grayX,2) == options.MaxFractionSize)
      savename = fullfile(options.SaveRoot,sprintf([options.SaveFileTag,'_Pos_f%.3d.mat'],SAVE_BLOCK_NUMBER));
      save(savename,'grayX','y','myBBox','myIdx');
      SAVE_BLOCK_NUMBER = SAVE_BLOCK_NUMBER + 1;
      grayX = [];
      y = [];
      myBBox = [];
      myIdx = [];
      if(options.Verbose)
        fprintf('Saving block number %d\n',SAVE_BLOCK_NUMBER-1);
      end
   end
end
savename = fullfile(options.SaveRoot,sprintf([options.SaveFileTag,'_Pos_f%.3d.mat'],SAVE_BLOCK_NUMBER));
save(savename,'grayX','y','myBBox','myIdx');

grayX = [];
y= [];
myBBox = [];
myIdx = [];
previm = -1;
SAVE_BLOCK_NUMBER = 1;

% EXTRACT NEGATIVE CROPS
% for every bounding box
for i = 1:length(nIdxs)
   imidx = nIdxs(i);
   % if necessary, load the image
   if(imidx ~= previm);
      im = imread(CAfilelist{imidx}.imagename);
      previm = imidx;
   end
   % crop, remoce color, and resize the sample
   gray_cr = imresize(rgb2gray(imcrop_pad(im,nBBoxs(i,:),'symmetric')),options.SaveResolution,'bilinear');
   grayX(:,end+1) = gray_cr(:);
   % these following variables record the crop info relative to the save block
   y(end+1) = nYs(i);
   myBBox((end+1),:) = nBBoxs(i,:);
   myIdx((end+1)) = nIdxs(i);
   fprintf('.');
   if(mod(i,50)==0) && (options.Verbose)
     fprintf('%d of %d negatives\n',i,length(nIdxs));
   end
   if(size(grayX,2) == options.MaxFractionSize)
      savename = fullfile(options.SaveRoot,sprintf([options.SaveFileTag,'_Neg_f%.3d.mat'],SAVE_BLOCK_NUMBER));
      save(savename,'grayX','y','myBBox','myIdx');
      SAVE_BLOCK_NUMBER = SAVE_BLOCK_NUMBER + 1;
      grayX = [];
      y = [];
      myBBox = [];
      myIdx = [];
      if(options.Verbose)
        fprintf('Saving block number %d\n',SAVE_BLOCK_NUMBER-1);
      end
   end
end
savename = fullfile(options.SaveRoot,sprintf([options.SaveFileTag,'_Neg_f%.3d.mat'],SAVE_BLOCK_NUMBER));
save(savename,'grayX','y','myBBox','myIdx');

