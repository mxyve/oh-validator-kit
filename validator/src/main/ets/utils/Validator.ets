/**
 * 数据校验工具类
 * 提供常用数据格式校验及自定义校验能力
 * @author mxy
 * @since 2025-11-04
 * @version 0.1.0
 */
export class Validator {
  /**
   * 校验手机号（中国大陆）
   * @param phone 手机号字符串
   * @returns 是否有效
   * @example
  * Validator.isPhone('13800138000') → true
   * Validator.isPhone('123456') → false
   */
  static isPhone(phone: string): boolean {
    return /^1[3-9]\d{9}$/.test(phone);
  }

  /**
   * 校验邮箱格式
   * @param email 邮箱字符串
   * @returns 是否有效
   * @example
  * Validator.isEmail('test@example.com') → true
   */
  static isEmail(email: string): boolean {
    return /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email);
  }

  /**
   * 校验身份证号（18位中国大陆）
   * @param idCard 身份证号字符串
   * @returns 是否有效
   * @example
  * Validator.isIdCard('110101199001011234') → true
   */
  static isIdCard(idCard: string): boolean {
    if (!/^\d{17}[\dXx]$/.test(idCard)) return false;
    // 简单校验，如需严格校验可补充最后一位校验码算法
    return true;
  }

  /**
   * 校验URL格式
   * @param url URL字符串
   * @returns 是否有效
   * @example
  * Validator.isUrl('https://example.com') → true
   * Validator.isUrl('ftp://192.168.1.1') → true
   */
  static isUrl(url: string): boolean {
    return /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/.test(url);
  }

  /**
   * 校验密码强度（至少8位，包含字母和数字）
   * @param password 密码字符串
   * @returns 是否符合强度要求
   * @example
  * Validator.isStrongPassword('Abc12345') → true
   */
  static isStrongPassword(password: string): boolean {
    return password.length >= 8 && /[a-zA-Z]/.test(password) && /\d/.test(password);
  }

  /**
   * 校验是否为纯数字
   * @param num 数字字符串
   * @returns 是否为纯数字
   * @example
  * Validator.isNumber('12345') → true
   * Validator.isNumber('123.45') → false
   */
  static isNumber(num: string): boolean {
    return /^\d+$/.test(num);
  }

  /**
   * 校验是否为中文
   * @param chinese 中文字符串
   * @returns 是否为纯中文
   * @example
  * Validator.isChinese('你好') → true
   */
  static isChinese(chinese: string): boolean {
    return /^[\u4e00-\u9fa5]+$/.test(chinese);
  }

  /**
   * 自定义正则校验
   * @param value 待校验值
   * @param regex 正则表达式
   * @returns 是否匹配
   * @example
  * Validator.customCheck('abc', /^[a-z]+$/) → true
   */
  static customCheck(value: string, regex: RegExp): boolean {
    return regex.test(value);
  }

  /**
   * 多规则联合校验
   * @param value 待校验值
   * @param validators 校验函数数组
   * @returns 是否全部通过
   * @example
  * Validator.checkAll('test', [
   *   (v) => v.length > 0,
   *   (v) => v.includes('test')
   * ]) → true
   */
  static checkAll(
    value: string,
    validators: ((val: string) => boolean)[]
  ): boolean {
    return validators.every(validator => validator(value));
  }
}