import localUnitTest from './LocalUnit.test';
import ValidatorTest from './ValidatorTest.test';

export default function testsuite() {
  localUnitTest();
  ValidatorTest();
}