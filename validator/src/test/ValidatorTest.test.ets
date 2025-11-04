import { describe, expect, it } from '@ohos/hypium';
import { Validator } from '../main/ets/utils/Validator'; // 替换为实际路径

export default function ValidatorTest() {
  describe('ValidatorTest', () => {
    /**
     * 测试手机号校验
     */
    it('isPhone_should_validate_cn_phone', 0, () => {
      // 有效手机号
      expect(Validator.isPhone('13800138000')).assertTrue();
      expect(Validator.isPhone('19912345678')).assertTrue();
      // 无效手机号（长度错误、开头错误）
      expect(Validator.isPhone('1234567890')).assertFalse(); // 10位
      expect(Validator.isPhone('23800138000')).assertFalse(); // 开头非1
      expect(Validator.isPhone('1380013800')).assertFalse();  // 10位
      expect(Validator.isPhone('')).assertFalse();            // 空字符串
    });

    /**
     * 测试邮箱校验
     */
    it('isEmail_should_validate_email_format', 0, () => {
      // 有效邮箱
      expect(Validator.isEmail('test@example.com')).assertTrue();
      expect(Validator.isEmail('user.name+tag@domain.co')).assertTrue();
      // 无效邮箱（无@、无域名、格式错误）
      expect(Validator.isEmail('test.example.com')).assertFalse(); // 无@
      expect(Validator.isEmail('test@.com')).assertFalse();         // 域名不完整
      expect(Validator.isEmail('@example.com')).assertFalse();      // 无用户名
      expect(Validator.isEmail('test@com')).assertFalse();          // 无二级域名
    });

    /**
     * 测试身份证号校验（18位）
     */
    it('isIdCard_should_validate_id_card', 0, () => {
      // 格式有效（17位数字+最后一位数字/X）
      expect(Validator.isIdCard('110101199001011234')).assertTrue();
      expect(Validator.isIdCard('11010119900101123X')).assertTrue();
      expect(Validator.isIdCard('11010119900101123x')).assertTrue();
      // 格式无效（长度错误、字符错误）
      expect(Validator.isIdCard('11010119900101123')).assertFalse();  // 17位
      expect(Validator.isIdCard('1101011990010112345')).assertFalse(); // 19位
      expect(Validator.isIdCard('11010119900101123a')).assertFalse();  // 最后一位非数字/X
    });

    /**
     * 测试URL校验
     */
    it('isUrl_should_validate_url_format', 0, () => {
      // 有效URL
      expect(Validator.isUrl('https://example.com')).assertTrue();
      expect(Validator.isUrl('http://www.example.cn/path?query=1')).assertTrue();
      expect(Validator.isUrl('ftp://192.168.1.1')).assertTrue();
      // 无效URL（无协议、格式错误）
      expect(Validator.isUrl('example.com')).assertFalse();          // 无协议
      expect(Validator.isUrl('https:// example.com')).assertFalse(); // 包含空格
      expect(Validator.isUrl('http://.com')).assertFalse();          // 域名不完整
    });

    /**
     * 测试密码强度校验
     */
    it('isStrongPassword_should_check_password_strength', 0, () => {
      // 有效密码（≥8位，含字母和数字）
      expect(Validator.isStrongPassword('Abc12345')).assertTrue();
      expect(Validator.isStrongPassword('1234567a')).assertTrue();
      // 无效密码（长度不足、缺字母/数字）
      expect(Validator.isStrongPassword('Abc123')).assertFalse();    // 6位
      expect(Validator.isStrongPassword('abcdefgh')).assertFalse();  // 无数字
      expect(Validator.isStrongPassword('12345678')).assertFalse();  // 无字母
    });

    /**
     * 测试纯数字校验
     */
    it('isNumber_should_check_pure_digits', 0, () => {
      expect(Validator.isNumber('123456')).assertTrue();
      expect(Validator.isNumber('0')).assertTrue();
      expect(Validator.isNumber('123a45')).assertFalse(); // 含字母
      expect(Validator.isNumber('123.45')).assertFalse(); // 含小数点
      expect(Validator.isNumber('')).assertFalse();       // 空字符串
    });

    /**
     * 测试纯中文校验
     */
    it('isChinese_should_check_pure_chinese', 0, () => {
      expect(Validator.isChinese('你好世界')).assertTrue();
      expect(Validator.isChinese('测试123')).assertFalse(); // 含数字
      expect(Validator.isChinese('hello')).assertFalse();   // 含英文
      expect(Validator.isChinese('')).assertFalse();        // 空字符串
    });

    /**
     * 测试自定义正则校验
     */
    it('customCheck_should_validate_with_regex', 0, () => {
      // 校验6-12位字母数字组合
      const regex = /^[a-zA-Z0-9]{6,12}$/;
      expect(Validator.customCheck('abc123', regex)).assertTrue();
      expect(Validator.customCheck('ab', regex)).assertFalse();       // 长度不足
      expect(Validator.customCheck('abc@123', regex)).assertFalse();  // 含特殊字符
    });

    /**
     * 测试多规则联合校验
     */
    it('checkAll_should_pass_all_validators', 0, () => {
      const value = 'Test1234';
      // 联合规则：非空 + 长度≥6 + 含大写字母
      const validators: ((val: string) => boolean)[] = [
        (v) => v.length > 0,
        (v) => v.length >= 6,
        (v) => /[A-Z]/.test(v)
      ];
      expect(Validator.checkAll(value, validators)).assertTrue();

      // 不满足其中一个规则
      const invalidValue = 'test123';
      expect(Validator.checkAll(invalidValue, validators)).assertFalse();
    });
  });
}