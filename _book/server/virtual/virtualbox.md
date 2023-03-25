# virtualbox

---
## 错误

### Call to WHvSetupPartition failed: ERROR_SUCCESS (Last=0xc000000d/87) (VERR_NEM_VM_CREATE_FAILED).

#### 解决方式
开启win的虚拟服务
- 管理员cmd:bcdedit /set hypervisorlaunchtype off
- 关闭 hyper-v,windows sandbox
- 开启 virtual Machine Platform,windows hypervisor PlatForm

#### 错误原因
win没有正确开启虚拟机服务