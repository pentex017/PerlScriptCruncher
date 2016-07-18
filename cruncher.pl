#################################################################################################################################################################################
#INSTRUCTIONS                                                                                                                                                                   #   
#To use this, make sure you have perl in your computer.                                                                                                                         #
#Go to your folder where all your datalogs are located.                                                                                                                         #
#Copy this .pl file in that directory.                                                                                                                                          #
#Open cmd prompt. Type in this: cd <directory of your folder>                                                                                                                   #
#Press ENTER.                                                                                                                                                                   #
#Type in this: perl cruncher.pl >> <any name you want to name your output file containing your query>.log                                                                       #
#Sample display on cmd prompt: C:\Users\jblp\Desktop\New folder (2)\New folder> perl cruncher.pl >> datalog_summary.log                                                         #
#Note that the ">> output.log" textline is the way cmd saves log to a file. You can always use "> output.log" if you want to overwrite your initial output file.                #
#You can use any extension, .txt, .log, anything. But good idea is to do not use the extension of your datalog files because you will end up scanning your output file as well. #
#Comments in perl are preceeded by # sign (hashtag/number sign). Modify anything to suits your needs.                                                                           #
#################################################################################################################################################################################

opendir(DIR, ".") or die "cannot open directory";
#You can specify what type of files you want to scan. Currently, it is used to scan for files with .txt extension.
#You can change it to read .asc files, .log files, etc. Just keep in mind that your

@docs = grep(/\.txt$/,readdir(DIR));
#@docs = grep(/\.asc$/,readdir(DIR));



#These are the keyword strings/or strings you want to find inside the file. Just change the value inside the apostrophes ""
#@stringtofind, in coding terms, are variables used to contain your keywords. In here, you can search 3 keywords, you can add more if you want.

my @stringtofind = "valuemap CLKDIV_Incoming_50MHZ";
my @stringtofind1 = "valuemap CLKDIV_Trim_50MHZ";
my @stringtofind2 = "valuemap CLKDIV_Trim_50MHZ_RANGE1";
my @stringtofind3 = "valuemap CLKDIV_Screen_50MHZ_NOM";

my @stringtofind4 = "valuemap Read_SMR_to_MDUT:lotGetArray";
my @stringtofind5 = "valuemap Read_SMR_to_MDUT:wfrGetArray";
my @stringtofind6 = "valuemap Read_SMR_to_MDUT:diexGetArray";
my @stringtofind7 = "valuemap Read_SMR_to_MDUT:dieyGetArray";

#my @stringtofind1 = "anything you want to search here, just replace this text. be sure to uncomment the #print in the while loop below corresponding to stringtofind1";
#my @stringtofind2 = "anything you want to search here, just replace this text. be sure to uncomment the #print in the while loop below corresponding to stringtofind2";


my $num = 1;
foreach $file (@docs)
{
   open (RES, $file) or die "could not open $file\n";
   print "Reading file# $num. File Name >> $file \n";
   while(<RES>)
      {
         #You can look into file and search up to 3 strings. If you want to increase it, just increase the # of declared variables above (@stringtofind variables).
         #Then after that, you can just add a new print line item here.
         #You can also turn off the items if you are only concerned with 1 line. From the sample given, it will print out all lines in all the datalogs
         #which contain "3 Bit     tAS  tKC=7.5" keyword
         
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind1/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind2/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind3/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind4/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind5/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind6/);
         print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind7/);
         #print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind1/); #Remove the # on the #print if you want to scan the files for more than 1 keyword.
         #print "$file>> Line#>>$. Keyword>>$_" if(/@stringtofind2/); #Remove the # on the #print if you want to scan the files for more than 1 keyword.
      }
   print "\n";
   $num++;
}
#close RES;