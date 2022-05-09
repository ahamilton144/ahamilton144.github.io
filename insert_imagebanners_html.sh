#!/bin/bash

### insert two images side by side on home page, between navbar and body
html_files=(index.html research.html publications.html teaching.html cv.html)
image1s=(yosemite_crop-scaled.jpg oroville_crop-scaled.jpg fkc_crop-scaled.jpg farms_crop-scaled.jpg kernriver_crop-scaled.jpg)
image2s=(SierraEscarpmentCA_crop.jpg sanluis_crop-scaled.jpg calaqMojave_crop-scaled.jpg grapes_crop-scaled.jpg delta_crop-scaled.jpg)
num_pages=${#html_files[@]}

for (( i=0; i<$num_pages; i++ ));do
	html_file=${html_files[$i]}
	image1=${image1s[$i]}
	image2=${image2s[$i]}
	line=$(grep -n '   <div class="container-xl">' '_build/html/'$html_file | tr ":" " " | tr "<" " " | tr ">" " " | tr '"' ' ')
	line=($line)
	line=${line[0]}
	let line--
	sed -i "${line}i <div><img src='_images/${image1}' width='50%'><img src='_images/${image2}' width='50%'></div> \n" '_build/html/'$html_file

done

### repeat with all news stories
html_files=$(find _build/html/ -name 'news*.html')
html_files=($html_files)
image1=sacriver_crop-scaled.jpg
image2=lariver_crop-scaled.jpg
num_pages=${#html_files[@]}

for (( i=0; i<$num_pages; i++ ));do
        html_file=${html_files[$i]}
	line=$(grep -n '   <div class="container-xl">' $html_file | tr ":" " " | tr "<" " " | tr ">" " " | tr '"' ' ')
        line=($line)
        line=${line[0]}
        let line--
        sed -i "${line}i <div><img src='_images/${image1}' width='50%'><img src='_images/${image2}' width='50%'></div> \n" $html_file

done


