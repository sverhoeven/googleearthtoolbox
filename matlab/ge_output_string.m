function ge_output_string(fh,output,varargin)
% Print 'output' string to file handler 'fh'.

AuthorizedOptions = authoptions( mfilename );

msgToScreen = false;
    
parsepairs; %script that parses Parameter/value pairs.

if msgToScreen
   disp(['Running ' mfilename '...']);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fh.fid,'%s',output);

if msgToScreen
   disp(['Running ' mfilename '...Done']) 
end
