# cube-optimization-module
# Cube Memory Management Optimization Module

Memory management optimization for Exynos platforms.  

## Feature ##
- Pure memory management optimization module, not containing other placebo and supporting all mainstream platforms
- Customizable list of protected APPs, preventing them from being killed by Android in-kernel lowmemorykiller
- Fixed system common files in the file page cache, which significantly reduced the stucks caused by the key cache being swapped out due to page cache fluctuations
- Reduce jitters under high memory pressure, adjust the trigger threshold and execution interval of lowmemorykiller, and keep the file page cache at a high level
- Reduce stucks under high memory pressure, reduce the probability of direct memory allocation via higher watermark_low
- Disable adaptive lowmemorykiller
- Prohibit kernel memory recycling threads running on the prime core, avoid congesting the main thread that is interacting and reduce energy consumption
- Avoid swapping memory pages which are hard to compress to ZRAM, make the compression rate close to the ideal value of 2.8x
- Customizable ZRAM size and compression algorithm(needs kernel support), ranging from 500 MB to 4GB (Note that the higher Zram cache than Ram may cause device lags)
- SELinux can still be enabled

# Requirements #

Module Requirements:
     
     -Magisk must be latest 
     
     -Exynos based device

#Instructions
     
     - Flash only in Magisk then Reboot
     - To modify the EnhancedShield and ZRAM disk size just go to Android Folder using any file manager.



