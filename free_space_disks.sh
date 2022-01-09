#!/usr/bin/bash

df_func()
{
    disk_drive1=$1
    check_out1='udev'
    check_out_source=`df  --output=source  -hk  $disk_drive1 | sed -n 2p`
    check_out_size=`df  --output=size  -h  $disk_drive1 | sed -n 2p`
    # echo $check_out_source
    if  [ $check_out_source !=  udev ] && [ $check_out_size != 512M ]; then
        echo "------------Free space on $disk_drive1--------------"
        df -kh ${disk_drive1}
    fi
    # echo "--------Free space on $disk_drive1------------"
    # df -kh ${disk_drive1}
} 


for d in `lsblk | cut -d " " -f1 | grep -o -E 'sd[a-f]|sd[a-f][0-9]' | uniq`
do 
    df_func /dev/$d
done

exit 0