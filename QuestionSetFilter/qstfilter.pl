# question set filter
# Author : Xingyu Na
# Data   : April 2012

die "usage:\n\tperl qsfilter.pl qs.hed full_label.list\n\n" if($#ARGV<1);

print STDERR "Load data from file ...\n";
@lines = <>;

@qslist = grep {/QS \"/} @lines;
@lab = grep {not /QS \"/ and /\d/} @lines; 

keys(%class) = $#qslist;
$qsnum = $#qslist;
$used = 0;
print STDERR "start filtering ...\n";
for $qsid (0..$qsnum)
{
	$qslist[$qsid]=~/\"(.*)\"/;
	print STDERR "  checking($qsid|$used|$qsnum):  $qsid.$1\t\t";
	$qslist[$qsid]=~/\{(.+?)\}/;
	$buf=$1;
	$buf=~s/\*//g;
	@answer=split /,/,$buf;
	$yes="";
	$n=0;
	for $labid (0..$#lab)
	{
		for (@answer)
		{
			if(index($lab[$labid],$_)>=0)
			{
				$n++;
				$yes.=$labid;
				last;
			}
		}
	}
	if(not exists $class{$yes})
	{
		$used++;
		$class{$yes}=$qsid;
		print STDERR "($n)use\n";
		print "$qslist[$qsid]";
	}
	else
	{
		$qslist[$class{$yes}]=~/\"(.*)\"/;
		print STDERR "($n)same as: $class{$yes}.$1\n";
	}
}
print STDERR "finish.\n";
