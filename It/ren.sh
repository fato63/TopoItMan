ls -1 OK_*.htm | while read id
do
    en=$(echo "$id" |awk  '{ print substr($0,4) }')
echo "mv $id $en"
mv $id $en
done
