#ifndef __MAKE_PATCH_H__
#define __MAKE_PATCH_H__

#ifdef __cplusplus
extern "C"
{
#endif

uint8_t *mkpatch(const char *old_file, const char *new_file, uint32_t *patch_size);

#ifdef __cplusplus
}
#endif

#endif
