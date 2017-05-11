function [pBBoxs,pIdxs] = SSDB_BoundingBoxesPositive(UseIndicies,objname,CAfilelist);
%function [pBBoxs,pIdxs] = SSDB_BoundingBoxesPositive(UseIndicies,objname,CAfilelist);
%
pBBoxs = [];
pIdxs = [];
for i = 1:length(UseIndicies)
  CAidx = UseIndicies(i);
  ol = QReadOList2(CAfilelist{CAidx}.olistname);
  if(~isfield(ol,objname)), continue, end;
  for j = 1:length(ol.(objname))
    bbox_orig = poly2bbox(ol.(objname){j});
    bbox = bboxEnforceAspectRatio(bbox_orig,[.1 .1],'bottom');
    %for padding around the crop.
    bbox = [bbox(1) - bbox(3)/6,bbox(2) - bbox(4)/6,bbox(3)*4/3,bbox(4)*4/3];
    if(BBoxIsInside(bbox,[.5 .5 1280 960]));
      pBBoxs(end+1,:) = bbox;
      pIdxs(end+1) = CAidx;
    end
  end
end
