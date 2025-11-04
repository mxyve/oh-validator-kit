# Changelog

所有显著变更将记录在本文件中。
遵循 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，采用 [语义化版本](https://semver.org/) 编号。


## [1.0.0] - 2025-11-04
### Added
- 初始稳定版本发布，包含以下核心校验功能：
    - 中国大陆手机号校验（`isPhone`），支持13-19开头的11位数字
    - 邮箱格式校验（`isEmail`），支持含特殊字符的用户名和多级域名
    - 18位中国大陆身份证号格式校验（`isIdCard`），支持最后一位为数字或X/x
    - URL格式校验（`isUrl`），支持http/https/ftp协议
    - 密码强度校验（`isStrongPassword`），要求至少8位且包含字母和数字
    - 纯数字校验（`isNumber`），仅允许0-9的数字字符
    - 纯中文校验（`isChinese`），仅允许Unicode中文字符（\u4e00-\u9fa5）
    - 自定义正则校验（`customCheck`），支持传入任意正则表达式
    - 多规则联合校验（`checkAll`），支持组合多个校验函数并返回整体结果

### 说明
- 本版本已通过单元测试验证所有方法的基础功能
- 支持鸿蒙API版本 ≥5.0.0（见 `package.json` 中 `engines` 配置）
- 开源协议为 Apache-2.0（见 `LICENSE` 文件）