#!/bin/sh
pre_pwd=`pwd`
cd ../../

image_dir_list=(
	"./resources/blink_detect.48x32/train"
)

class1_list_file="train/class1.lst"
class2_list_file="train/class2.lst"
class3_list_file="train/class3.lst"
class4_list_file="train/class4.lst"

save_imagepath()
{
	local dir_list=$1
	local imagelist_file=$2
	local keyword=$3
	
	touch $imagelist_file
	for dir in ${dir_list[*]}
	do
		find $dir -name "*" | grep -i -E ".jpg" | grep -i -E $keyword >> $imagelist_file
	done
}

rm -rf train
mkdir train

kw_1="open_eye"
kw_2="close_eye"

save_imagepath $image_dir_list $class1_list_file $kw_1
save_imagepath $image_dir_list $class2_list_file $kw_2

mv train $pre_pwd
