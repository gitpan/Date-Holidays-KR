use strict;
use DateTime;
use Date::Holidays::KR;
use Test::More tests => 24;


my %tests = (
    1989 => {
        '0101' => '신정',
        '0205' => '설앞날',
        '0206' => '설날',
        '0207' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0512' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0913' => '추석앞날',
        '0914' => '추석',
        '0915' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1990 => {
        '0101' => '신정',
        '0126' => '설앞날',
        '0127' => '설날',
        '0128' => '설뒷날',
        '0301' => '삼일절',
        '0502' => '부처님오신날',
        '0505' => '어린이날',
        '0606' => '현충일',
        '0815' => '광복절',
        '1002' => '추석앞날',
        '1003' => '추석',
        '1004' => '추석뒷날',
        '1225' => '크리스마스',
    },
    1991 => {
        '0101' => '신정',
        '0214' => '설앞날',
        '0215' => '설날',
        '0216' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0521' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0921' => '추석앞날',
        '0922' => '추석',
        '0923' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1992 => {
        '0101' => '신정',
        '0203' => '설앞날',
        '0204' => '설날',
        '0205' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0510' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0910' => '추석앞날',
        '0911' => '추석',
        '0912' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1993 => {
        '0101' => '신정',
        '0122' => '설앞날',
        '0123' => '설날',
        '0124' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0528' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0929' => '추석앞날',
        '0930' => '추석',
        '1001' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1994 => {
        '0101' => '신정',
        '0209' => '설앞날',
        '0210' => '설날',
        '0211' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0518' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0919' => '추석앞날',
        '0920' => '추석',
        '0921' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1995 => {
        '0101' => '신정',
        '0130' => '설앞날',
        '0131' => '설날',
        '0201' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0507' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '1003' => '개천절',
        '1008' => '추석앞날',
        '1009' => '추석',
        '1010' => '추석뒷날',
        '1225' => '크리스마스',
    },
    1996 => {
        '0101' => '신정',
        '0218' => '설앞날',
        '0219' => '설날',
        '0220' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0524' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0926' => '추석앞날',
        '0927' => '추석',
        '0928' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1997 => {
        '0101' => '신정',
        '0207' => '설앞날',
        '0208' => '설날',
        '0209' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0514' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0915' => '추석앞날',
        '0916' => '추석',
        '0917' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    1998 => {
        '0101' => '신정',
        '0127' => '설앞날',
        '0128' => '설날',
        '0129' => '설뒷날',
        '0301' => '삼일절',
        '0503' => '부처님오신날',
        '0505' => '어린이날',
        '0606' => '현충일',
        '0815' => '광복절',
        '1003' => '개천절',
        '1004' => '추석앞날',
        '1005' => '추석',
        '1006' => '추석뒷날',
        '1225' => '크리스마스',
    },
    1999 => {
        '0101' => '신정',
        '0215' => '설앞날',
        '0216' => '설날',
        '0217' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0522' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0923' => '추석앞날',
        '0924' => '추석',
        '0925' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2000 => {
        '0101' => '신정',
        '0204' => '설앞날',
        '0205' => '설날',
        '0206' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0511' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0911' => '추석앞날',
        '0912' => '추석',
        '0913' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2001 => {
        '0101' => '신정',
        '0123' => '설앞날',
        '0124' => '설날',
        '0125' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0530' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0930' => '추석앞날',
        '1001' => '추석',
        '1002' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2002 => {
        '0101' => '신정',
        '0211' => '설앞날',
        '0212' => '설날',
        '0213' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0519' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0920' => '추석앞날',
        '0921' => '추석',
        '0922' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2003 => {
        '0101' => '신정',
        '0131' => '설앞날',
        '0201' => '설날',
        '0202' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0508' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0910' => '추석앞날',
        '0911' => '추석',
        '0912' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2004 => {
        '0101' => '신정',
        '0121' => '설앞날',
        '0122' => '설날',
        '0123' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0526' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0927' => '추석앞날',
        '0928' => '추석',
        '0929' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2005 => {
        '0101' => '신정',
        '0208' => '설앞날',
        '0209' => '설날',
        '0210' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0515' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0917' => '추석앞날',
        '0918' => '추석',
        '0919' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2006 => {
        '0101' => '신정',
        '0128' => '설앞날',
        '0129' => '설날',
        '0130' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '1003' => '개천절',
        '1005' => '추석앞날',
        '1006' => '추석',
        '1007' => '추석뒷날',
        '1225' => '크리스마스',
    },
    2007 => {
        '0101' => '신정',
        '0217' => '설앞날',
        '0218' => '설날',
        '0219' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0524' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0924' => '추석앞날',
        '0925' => '추석',
        '0926' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2008 => {
        '0101' => '신정',
        '0206' => '설앞날',
        '0207' => '설날',
        '0208' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0512' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0913' => '추석앞날',
        '0914' => '추석',
        '0915' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2009 => {
        '0101' => '신정',
        '0125' => '설앞날',
        '0126' => '설날',
        '0127' => '설뒷날',
        '0301' => '삼일절',
        '0502' => '부처님오신날',
        '0505' => '어린이날',
        '0606' => '현충일',
        '0815' => '광복절',
        '1002' => '추석앞날',
        '1003' => '추석',
        '1004' => '추석뒷날',
        '1225' => '크리스마스',
    },
    2010 => {
        '0101' => '신정',
        '0213' => '설앞날',
        '0214' => '설날',
        '0215' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0521' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0921' => '추석앞날',
        '0922' => '추석',
        '0923' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2011 => {
        '0101' => '신정',
        '0202' => '설앞날',
        '0203' => '설날',
        '0204' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0510' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0911' => '추석앞날',
        '0912' => '추석',
        '0913' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
    2012 => {
        '0101' => '신정',
        '0122' => '설앞날',
        '0123' => '설날',
        '0124' => '설뒷날',
        '0301' => '삼일절',
        '0505' => '어린이날',
        '0528' => '부처님오신날',
        '0606' => '현충일',
        '0815' => '광복절',
        '0929' => '추석앞날',
        '0930' => '추석',
        '1001' => '추석뒷날',
        '1003' => '개천절',
        '1225' => '크리스마스',
    },
);

for my $year (sort keys %tests) {
    my $holidays = holidays($year);
    is_deeply( $holidays, $tests{$year}, "holidays of $year" );
}

done_testing;
