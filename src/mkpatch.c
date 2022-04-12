#include <string.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "bsdiff.h"
#include "lzma_compress.h"

#ifndef _WIN32
#define O_BINARY 0
#endif

static int diff_data_write(struct bsdiff_stream* stream, const void* buffer, int size)
{
    FILE *pf;
    uint8_t *dp = (uint8_t*)buffer;

    pf = (FILE*) stream->opaque;
    fwrite((void*) buffer, size, 1, pf);

    return 0;
}

uint8_t *mkpatch(const char *old_file, const char *new_file, uint32_t *patch_size)
{
    int fd;
    uint8_t *old = NULL, *new = NULL, *diff = NULL, *diff_lz = NULL;
    uint8_t *patch = NULL;
    uint32_t oldsize, newsize, diffsize, patchsize = 0;
    int lzsize;
    uint8_t buf[8];
    FILE *pf = NULL;
    struct bsdiff_stream stream;

    stream.malloc = malloc;
    stream.free = free;
    stream.write = diff_data_write;

    /* Allocate oldsize+1 bytes instead of oldsize bytes to ensure
            that we never try to malloc(0) and get a NULL pointer */
    if (((fd = open(old_file, O_RDONLY | O_BINARY, 0)) < 0) ||
            ((oldsize = lseek(fd, 0, SEEK_END)) == -1) ||
            ((old = malloc(oldsize + 1)) == NULL) ||
            (lseek(fd, 0, SEEK_SET) != 0) ||
            (read(fd, old, oldsize) != oldsize) ||
            (close(fd) == -1)) 
    {
        goto _exit;
    }

    /* Allocate newsize+1 bytes instead of newsize bytes to ensure
            that we never try to malloc(0) and get a NULL pointer */
    if (((fd = open(new_file, O_RDONLY | O_BINARY, 0)) < 0) ||
            ((newsize = lseek(fd, 0, SEEK_END)) == -1) ||
            ((new = malloc(newsize + 1)) == NULL) ||
            (lseek(fd, 0, SEEK_SET) != 0) ||
            (read(fd, new, newsize) != newsize) ||
            (close(fd) == -1)) 
    {
        goto _exit;
    }

    /* Create the patch file */
    if ((pf = fopen("diff_raw.bin", "wb")) == NULL)
    {
        printf("%s\n", "diff_raw.bin");
        goto _exit;
    }
    stream.opaque = pf;
    if (bsdiff(old, oldsize, new, newsize, &stream))
    {
        printf("bsdiff\n");
    }
    fclose(pf);
    
    //读出数据并压缩
    if (((fd = open("diff_raw.bin", O_RDONLY | O_BINARY, 0)) < 0) ||
            ((diffsize = lseek(fd, 0, SEEK_END)) == -1) ||
            ((diff = malloc(diffsize + 1)) == NULL) ||
            (lseek(fd, 0, SEEK_SET) != 0) ||
            (read(fd, diff, diffsize) != diffsize) ||
            (close(fd) == -1)) 
    {
        printf("%s\n", "diff_raw.bin");
        goto _exit;
    }
    lzsize = diffsize + 10 * 1024;
    diff_lz = malloc(lzsize);
    lzma_compress(diff_lz, &lzsize, diff, diffsize, 12, 9);
	
	//删除中间文件
	remove("diff_raw.bin");
    
    //写入文件  
    patch = malloc(16 + sizeof (buf) + lzsize + 1);
    patchsize = 0;
    if(patch != NULL)
    {
        memcpy(&patch[patchsize], "ENDSLEY/BSDIFF43", 16);
        patchsize += 16;
        
        offtout(newsize, buf);        
        memcpy(&patch[patchsize], buf, sizeof (buf));
        patchsize += sizeof (buf);
        
        memcpy(&patch[patchsize], diff_lz, lzsize);
        patchsize += lzsize;
        *patch_size = patchsize;
    }
     
    /* Free the memory we used */
_exit:
    if(old != NULL)free(old);
    if(new != NULL)free(new);
    if(diff != NULL)free(diff);
    if(diff_lz != NULL)free(diff_lz);

    return patch;
}

