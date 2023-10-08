## parse all image-files and retrieve text of the certificate
# go to the folder with GDrive files
destination_file=$HOME/out.txt
touch $destination_file
for each_file in `ls .`; do
    link="https://drive.google.com/file/d/${each_file}/view?usp=drive_link" 
    text_cr=`ocr $each_file | grep -A 2  "successfully completed" | grep -v "successfully completed"`
    text=`echo $text_cr | tr "\n" ' '`
    echo "[${text}](${link})" >> $destination_file
done
cat $destination_file
