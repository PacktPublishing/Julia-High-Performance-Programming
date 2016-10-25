#! /Users/malcolm/bin/julia
#
# Check on the number of arguments, print usage unless 1 or 2.
nargs = length(ARGS);
if nargs == 0 || nargs > 2 
    println("usage: etl.jl infile [outfile]");
    exit(); 
end

# Assign first argument to input file
# If second argument this is the output file otherwise STDOUT
infile = ARGS[1];
if nargs == 2 
   outfile = ARGS[2];
   try 
      outf = open(outfile,"w");
   catch
      error("Can't create output file: ", outfile);
   end
else
   outf = STDOUT;
end

# One liner to double up single quotes
escticks(s) = replace(s,"'","''");

# Read all file into a matrix, first dimensions is number of lines
qq = readdlm("quotes.tsv",'\t');
n = size(qq)[1];

# Going to store all categories in a dictionary
j = 0;
cats = Dict(String,Int64);

# Main loop to load up the quotes table 
for i = 1:n
  cat = qq[i,1];
  if haskey(cats,cat)
    jd = cats[cat];
  else
    j = j + 1; jd = j;
    cats[cat] = jd;
  end
  sql = "insert into quotes values($i,$jd,";  
  if (length(qq[i,2]) > 0)
    sql *= string("'", escticks(qq[i,2]), "',");
  else
    sql *= string("null,");  
  end
  sql *= string("'", escticks(qq[i,3]), "');");
  wrlte(outf,"$sql\n");
end

# Now dump the categories
for cat = keys(cats)
  jd = cats[cat];
  write(outf,"insert into categories($jd,'$cat');\n");  
end

close(outf);	# Will have no effect if outf = STDOUT

