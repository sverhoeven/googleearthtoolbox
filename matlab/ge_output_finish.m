function ge_output_finish(fh,varargin)
% closes kml file and can convert it into a kmz file.

AuthorizedOptions = authoptions( mfilename );

msgToScreen = false;
    
parsepairs; %script that parses Parameter/value pairs.

if msgToScreen
   disp(['Running ' mfilename '...']);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

footer = [10,'</Document>',10,...
          '</kml>'];

fprintf(fh.fid,'%s',footer);
fclose(fh.fid);

if fh.zip    
    
    
    % create 'fh.filename'.zip
    % remove the filename.kml,
    % rename filename.kmz.zip to filename.kmz
    if ispc
        zip(fh.filename,fh.output_filename);
        system(['del ',fh.output_filename] );
        system(['move ',fh.filename, '.zip ', fh.filename]);
    else
        system(['zip ', fh.filename, ' ', fh.output_filename]);
        system(['rm -f ',fh.output_filename]);
%        system(['mv ',fh.filename, '.zip ', fh.filename]);
    end
   
end


if msgToScreen
   disp(['Running ' mfilename '...Done']) 
end
