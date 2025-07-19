
export {}

declare global {
  interface String {
    // kita bisa tambahkan disini, atau i file yg 1.test-extension-method.ts
    // tapi file itu kita jadikan sebuah module yg export / yg ngasih fungsi ke luar

    isPalindrom(): boolean;

  }
}