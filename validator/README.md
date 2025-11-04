# @hmos/validator-kit

鸿蒙ArkTS数据校验工具库，提供手机号、邮箱、身份证号等常用数据格式校验，支持自定义规则与多规则联合校验，适用于表单提交、用户输入验证等场景。

## 简介

`@hmos/validator-kit` 是一款轻量级鸿蒙ArkTS校验工具，封装了日常开发中高频使用的校验逻辑，无需重复编写正则表达式，通过简洁的API即可完成数据合法性验证，提升开发效率。

## 特性

- **覆盖全面**：支持手机号、邮箱、身份证号、URL、密码强度等10+常用校验场景
- **灵活扩展**：提供自定义正则校验和多规则联合校验，满足复杂业务需求
- **零依赖**：纯ArkTS实现，无额外依赖，体积小巧
- **易用性强**：静态方法设计，无需实例化，直接调用
- **兼容性好**：支持鸿蒙API 5及以上版本

## 安装

使用鸿蒙包管理工具 `ohpm` 安装：

```bash
ohpm install @hmos/validator-kit
```

## 快速上手

### 基础用法

安装完成后，在代码中导入并使用：

```typescript
import { Validator } from '@hmos/validator-kit';

// 校验手机号
const isPhoneValid = Validator.isPhone('13800138000'); // true

// 校验邮箱
const isEmailValid = Validator.isEmail('user@example.com'); // true

// 校验身份证号
const isIdCardValid = Validator.isIdCard('110101199001011234'); // true

// 校验URL
const isUrlValid = Validator.isUrl('https://example.com'); // true

// 校验密码强度（至少8位，含字母和数字）
const isPasswordStrong = Validator.isStrongPassword('Abc12345'); // true
```

### 进阶用法

#### 自定义正则校验

```typescript
// 校验6-12位字母数字组合
const regex = /^[a-zA-Z0-9]{6,12}$/;
const isCustomValid = Validator.customCheck('abc123', regex); // true
```

#### 多规则联合校验

```typescript
// 校验规则：非空 + 长度≥6 + 包含大写字母
const validators: ((val: string) => boolean)[] = [
  (v) => v.length > 0,
  (v) => v.length >= 6,
  (v) => /[A-Z]/.test(v)
];

const isAllValid = Validator.checkAll('Test123', validators); // true
```

## API 文档

| 方法名                 | 描述                                      | 参数                                                | 返回值  |
|------------------------|-------------------------------------------|-----------------------------------------------------|---------|
| `isPhone`              | 校验中国大陆手机号（11位，以13-19开头）   | `phone: string`                                     | boolean |
| `isEmail`              | 校验邮箱格式（支持多级域名和特殊字符）     | `email: string`                                     | boolean |
| `isIdCard`             | 校验18位中国大陆身份证号（含X/x结尾）     | `idCard: string`                                    | boolean |
| `isUrl`                | 校验URL格式（支持http/https/ftp协议）     | `url: string`                                       | boolean |
| `isStrongPassword`     | 校验密码强度（至少8位，含字母和数字）     | `password: string`                                  | boolean |
| `isNumber`             | 校验是否为纯数字（不包含小数点或符号）     | `num: string`                                       | boolean |
| `isChinese`            | 校验是否为纯中文（仅含\u4e00-\u9fa5字符）  | `chinese: string`                                   | boolean |
| `customCheck`          | 自定义正则校验                            | `value: string, regex: RegExp`                      | boolean |
| `checkAll`             | 多规则联合校验（全部通过才返回true）      | `value: string, validators: ((val: string) => boolean)[]` | boolean |

## 兼容性

- 鸿蒙API版本：≥5.0.0
- DevEco Studio版本：≥4.0

## 常见问题

1. **Q：身份证号校验是否支持15位旧证？**  
   A：当前版本仅支持18位身份证号，15位旧证校验将在后续版本补充。

2. **Q：如何扩展自定义校验方法？**  
   A：可通过 `customCheck` 方法传入自定义正则，或基于 `Validator` 类扩展新方法。

3. **Q：密码强度校验规则能否修改？**  
   A：当前规则为固定逻辑（8位+字母+数字），如需自定义可使用 `customCheck` 结合正则实现。

## 开源协议

本项目基于 [Apache-2.0](LICENSE) 协议开源，详情参见 LICENSE 文件。

## 反馈与贡献

- 问题反馈：[GitHub Issues](https://github.com/mxyve/oh-validator-kit/issues)
- 代码贡献：欢迎提交PR，贡献新功能或修复bug
- 联系作者：1286280961@qq.com