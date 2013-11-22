function [fh] = ge_output_start(filename,varargin)
% Initiates a kml file, returns a file handler

AuthorizedOptions = authoptions( mfilename );


% Assign default values to parameters:
name = filename;

msgToScreen = false;
    
parsepairs; %script that parses Parameter/value pairs.

if msgToScreen
   disp(['Running ' mfilename '...']);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fh = struct;

% determine the output type/extension
fileext = filename( (end-2):end );

fh.filename = filename;

if strcmp(fileext,'kmz')
    output_filename = filename(1:(end-4));
    output_filename = strcat(output_filename,'.kml');
    fh.zip = 1;
else
    output_filename = filename;
    fh.zip = 0;
end

fh.output_filename = output_filename;

fh.fid = fopen(output_filename, 'wt');

header = ['<?xml version="1.0" encoding="UTF-8"?>',10,...
         '<kml xmlns="http://earth.google.com/kml/2.1">',10,...
         '<Document>',10,...
         '<name>',10,name,10,'</name>',10];

fprintf(fh.fid,'%s',header);

if msgToScreen
   disp(['Running ' mfilename '...Done']) 
end

