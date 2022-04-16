## 功能说明：

- 使用**bsdiff**库对输入的老固件和新固件进行差分计算，然后生成中间文件diff_raw.bin.

- 使用**lzma**库对中间文件进行压缩,然后按照**bsdiff**库的规范添加文件头.

- 参考**mkimage**的规范添加文件头,并额外增加了老固件的CRC校验值字段,最终生成**udiff**文件.


## 命令参考：

 `make_udiff -o old.bin -n new.bin -p udiff.bin`

- 命令参数说明：

```
  -A, --arch     set architecture to 'arch' (string [=arm])
  -O, --os       set operating system to 'os' (string [=rtos])
  -a, --addr     set load address to 'addr' (hex) (string [=0x0])
  -e, --ep       set entry point to 'ep' (hex) (string [=0x0])
  -o, --old      input old file name (string)
  -n, --new      input new file name (string)
  -p, --patch    output patch file name (string)
  -?, --help     print this message
```


## image头说明：

```
typedef struct image_header
{
    uint32_t ih_magic; /* Image Header Magic Number */
    uint32_t ih_hcrc;  /* Image Header CRC Checksum */
    uint32_t ih_time;  /* Image Creation Timestamp */
    uint32_t ih_size;  /* Image Data Size */
    uint32_t ih_load;  /* Data Load Address */
    uint32_t ih_ep;    /* Entry Point Address */
    uint32_t ih_dcrc;  /* Image Data CRC Checksum */
    uint8_t  ih_os;    /* Operating System */
    uint8_t  ih_arch;  /* CPU architecture */
    uint8_t  ih_type;  /* Image Type */
    uint8_t  ih_comp;  /* Compression Type */
    uint8_t  ih_name[28]; /* Image Name */
    uint32_t ih_ocrc;  /* Old Image Data CRC Checksum */  
} image_header_t;
```

- 其中**ih_ocrc**即为增加的新字段,用于IAP程序校验本补丁包是否适用于当前固件.
- 其中**ih_type**值固定为8.
- 其中**ih_comp**值固定为3.
