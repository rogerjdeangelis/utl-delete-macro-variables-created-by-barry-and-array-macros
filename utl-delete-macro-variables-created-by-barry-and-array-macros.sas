Delete macro variables created by barry and array macros

Macros on end and on my github

It is not easy to clear both Barts(barray) and Ted/Davids(array) with one macro

  Barts barray macro is more flexible with a 0 offset, functions and
  lbound and hbound macro variables
  Bartosz Jablonski yabwon@gmail.com

  So I added a macro for Ted and Davids array macro

  Authors: Ted Clay, M.S.   tclay@ashlandhome.net  (541) 482-6435
           David Katz, M.S. www.davidkatzconsulting.com

github
https://tinyurl.com/y79cl6ll
https://github.com/rogerjdeangelis/utl-delete-macro-variables-created-by-barry-and-array-macros

macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

Barts Original post with link to his macro
https://tinyurl.com/y89gvxdk
https://listserv.uga.edu/cgi-bin/wa?A2=ind1901c&L=SAS-L&O=D&X=1285DCB3130FFE6DED&Y=rogerjdeangelis%40gmail.com&P=32088


INPUT
=====

%let a_sentinel1=BEFORE_ARRAY;

%barray(funMon[0:3] $ 11, function = put(intnx("MONTH", '1jun2018'd, _I_, "E"), yymmn.))

%let z_sentinel1=AFTER_ARRAY;
%put _user_;

INPUT

Macro variables created
----------------------

GLOBAL A_SENTINEL1 BEFORE_ARRAY

LOBAL FUNMON0 201806
LOBAL FUNMON1 201807
LOBAL FUNMON2 201808
LOBAL FUNMON3 201809

LOBAL FUNMONHBOUND 3
LOBAL FUNMONLBOUND 0

LOBAL FUNMONN 4

GLOBAL Z_SENTINEL1 AFTER_ARRAY

EXAMPLE OUTPUT (macro variables removed)
----------------------------------------

GLOBAL A_SENTINEL1 BEFORE_ARRAY

GLOBAL Z_SENTINEL1 AFTER_ARRAY


PROCESS
=======

%bdeleteMacArray(funMon);
%put _user_;

For ARRAY macro

* create Ted and David array macro variables;
%array(nums,values=1-10);
%put _user_;

* remove created macro variables;
%deleteMacArray(nums);
%put _user_;


OUTPUT
see above

*
 _ __ ___   __ _  ___ _ __ ___  ___
| '_ ` _ \ / _` |/ __| '__/ _ \/ __|
| | | | | | (_| | (__| | | (_) \__ \
|_| |_| |_|\__,_|\___|_|  \___/|___/

;

* Ten and Davida macro arrayl
%macro deleteMacArray(arr)/des="dlete macro variables created using Ted/Davids array macro";;
  %local J;
  %do J = &&&arr.1 %to &&&arr.n;
    %put *&arr.&J.*;
    %symdel &arr.&J. / NOWARN;
  %end;
  %symdel &arr.n / nowarn;
%mend deleteMacArray;

* Barts enhancement barray;
%macro bdeleteMacArray(arr)/des="dlete macro variables created using Barts barray";
  %local J;
  %do J = &&&arr.LBOUND %to &&&arr.HBOUND;
    /*%put *&arr.&J.*;*/
    %symdel &arr.&J. / NOWARN;
  %end;
  %symdel &arr.LBOUND &arr.HBOUND &arr.N / NOWARN;
%mend bdeleteMacArray;


