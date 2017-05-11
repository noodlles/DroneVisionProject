function CAfilelist = SSDB_ListFiles( ImagePath,AnnoPath, WhichImages, IncludeMetaData)
%function CAfilelist = SSDB_ListFiles( UnderThisDirectory, FirstHowMany, SkipFirstHowMany, IncludeMetaData)
% S.M.Bileschi 7-4-03
% recursive nature removied 3-30-07
%
%Returns a structure for quickly accessing all files under a certain
%directory which are labeled in the !! jpg-olist !! format.
%
%if vector WhichImages is [] , then every such file will be returned.
%if IncludeMetaData is 'PleaseIncludeMetaData' then the olist information
%will be read from disk and included in the output
%
%UnderThisDirectory is a string representing a local directory and ending
%in /
%
%OUTPUT CAfilelist is a cell array, where each entry is a structure
%this structure has at least two keys: filename and olistname
%each of which is a string pointing to an image and corresponding olist.
%If IncludeMetaData is on, then an additional key, olist, will include the
%actual olist pointed to.
%
%MMMMMMMMMMMMMMMMMMMMMMMMMMM
%requires:
%   QReadOlist2
%MMMMMMMMMMMMMMMMMMMMMMMMMMM
if(nargin < 3)
   WhichImages = [];
end
if(nargin < 4)
   IncludeMetaData = [];
end

if ((exist(ImagePath)) ~= 7)
    fprintf('%s is not a directory \n', ImagePath);
end
if ((exist(AnnoPath)) ~= 7)
    fprintf('%s is not a directory \n', AnnoPath);
end
CAfilelist = {};
oprdir = AnnoPath;
%get files in this directory
IntendedSearch = fullfile(oprdir,'*_olist.mat');
FullList = dir(IntendedSearch);
allNames = {FullList.name};
if(isempty(WhichImages))
   WhichImages = 1:length(allNames);
end
if(any(WhichImages > length(allNames)));
   fprintf('ERROR: selected image is greater than length of database\n');
end
%Write the structure.
N=0;
for i = WhichImages
   N = N+1;
   CAfilelist{N}.olistname = fullfile(oprdir,allNames{i});
   [fPath,fName,fExt] = fileparts(CAfilelist{N}.olistname);
   CAfilelist{N}.imagename = fullfile(ImagePath,[strrep(fName, '_olist',''), '.JPG']);
   %check that there is a jpg corresponding to the _olist.mat, if not,
   %complain and quit.
        if (not(exist(CAfilelist{N}.imagename )))
            fprintf('%s is missing from the drive, execution terminated', CAfilelist{N}.imagename);
            return
        end
        if(IncludeMetaData)
            CAfilelist{N}.olist = QReadOList2(CAfilelist{N}.olistname);
        end 
    end 
end
