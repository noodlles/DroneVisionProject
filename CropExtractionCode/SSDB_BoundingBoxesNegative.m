function [nBBoxs,nIdxs,options] = SSDB_BoundingBoxesNegative(pBBoxs, pIndicies,nSourceIndicies,objname,CAfilelist,options);
%function [nBBoxs,nIdxs] = SSDB_BoundingBoxesNegative(pBBoxs, pIndicies,objname,CAfilelist,options);
%
%Chooses boxes from the same distribution of images, from the same sizes, which do not overlap
%The positive locations of the objects by more than (intersect) / (Union) > MatchThreshold
if(nargin < 6);
  options = [];
end
d.InSize = [960 1280];
d.NegsPerPos = 10;
d.MatchThreshold = .1;
d.RandSeed = rand*10000; % set the rand seed in the options to enforce reproducable results
d.Verbose = 0;
options = ResolveMissingOptions(options,d);

n=1;
seedrand(options.RandSeed);

% load the CAfilelist into a list of positive bounding boxes for each image;
u = unique(nSourceIndicies);
for i = u(:)'
   ol = QReadOList2(CAfilelist{i}.olistname);
   CAfilelist{i}.BoxData = [];
   if(isfield(ol,objname))
      PolyData = ol.(objname);
      for j = 1:length(PolyData)
          bbox = poly2bbox(ol.(objname){j});
          bbox = bboxEnforceAspectRatio(bbox,[.1 .1],'bottom');
          %for padding around the crop.
          bbox = [bbox(1) - bbox(3)/6,bbox(2) - bbox(4)/6,bbox(3)*4/3,bbox(4)*4/3];
          CAfilelist{i}.BoxData = [CAfilelist{i}.BoxData;bbox];
      end
   end
end
% for every positive box, select options.NegsPerPos negative boxes
% by picking random boxes and making sure they meet our overlap condition
npbox = size(pBBoxs,1);
nidx = length(nSourceIndicies);
for i = 1:npbox
   fprintf('NegBoxes for pos example %d of %d\r',i, npbox);
   if(options.Verbose)
      fprintf('\n');
   end
   for j = 1:options.NegsPerPos
      bFoundNegativeBox = 0;
      rand_box = ceil(rand*npbox);
      while(not(bFoundNegativeBox))
         rand_idx = ceil(rand*nidx);
         idx = nSourceIndicies(rand_idx);
         pbox = pBBoxs(rand_box,:);
         newbox =  SelectRandomBBox(options.InSize, pbox([4,3])+1);
         if(options.Verbose)
             fprintf('   box %d of %d\n',j,options.NegsPerPos);
         end
         if(CalculateOverlap(newbox,CAfilelist{rand_idx}.BoxData)<options.MatchThreshold)
             bFoundNegativeBox = 1;
         else
            if(options.Verbose)
               fprintf('   overlap\n');
            end
         end
      end
      [nBBoxs(n,:)] = newbox;
      nIdxs(n) = idx;
      idxout(n) = idx;
      n = n+1;
   end
end
fprintf('\n');


function overlap = CalculateOverlap(box,otherboxes)
% returns max of area(intersect)/area(union) over all otherboxes
if(isempty(otherboxes))
   overlap = 0;
   return;
end
ols = [];
for i = 1:size(otherboxes,1)
   isectbbox = BBoxIntersect(box,otherboxes(i,:));
   ols(i) = prod(isectbbox(3:4));
end
overlap = max(ols);
return;


function outbox = Get10PercentBox(inbox,idx,CAfilelist,objectname,options)
img = imread(CAfilelist{idx}.imagename);
olist = QReadOList2(CAfilelist{idx}.olistname);
if(isfield(olist,objectname))
  mask = QGetObjectMask(olist.(objectname),options.InSize);
else
  mask = zeros(options.InSize);
end
done = 0;
retrycount = 0;
while(not(done))
   while(any(options.InSize <= inbox([4,3])));
     inbox(3:4) = floor(inbox(3:4) * .9);
   end
   outbox =  SelectRandomBBox(options.InSize, inbox([4,3])+1);
   overlap = CalculateOverlap(outbox, mask);
   if(overlap < .1)
      done = 1;
   else
      retrycount = retrycount + 1;
   end
   if (retrycount == 25)
      retrycount = 0;
      inbox(3:4) = floor(inbox(3:4) * .9);
   end
end




