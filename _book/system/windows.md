# windows

## 错误

1. 无法加载文件，因为在此系统中禁止执行脚本

系统默认禁止执行powershell脚本

解决，开启信任脚本策略
> set-ExecutionPolicy RemoteSigned