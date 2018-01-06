cd /home/fato/Olds/fato/Documenti/speleo/Topodroid_GIT/TopoManual/It_v1
cp ../It/*.htm .
[ ! -d ../old_It_v1 ] && mkdir ../old_It_v1
ls -1 *.htm | while read nfl;
#grep -l 'è' *.htm | while read nfl;
do
  cp $nfl ../old_It_v1
  if [ $? -eq 0 ]; then
    cat ../old_It_v1/$nfl |sed -e "s/è/e'/g" |sed -e "s/é/e'/g" |sed -e "s/à/a'/g" |sed -e "s/ì/i'/g" |sed -e "s/ò/o'/g" |sed -e "s/ù/u'/g" |sed -e "s/È/E'/g" >$nfl
  Retcode=$?
  if [ $Retcode -ne 0 ]; then
    echo "Eliminazione caratteri accentati di $nfl in errore. Err=$Retcode"
    exit
  else
    echo 'Lavorato file--->'$nfl
  fi
  else
   echo "Copia di $nfl in errore"
   exit
  fi
  if [ -z $nfl ]; then
    echo "Lavorazione di $nfl in errore. File vuoto"
    exit
  else
    echo "Lavorazione file $nfl OK"
  fi
#exit
done