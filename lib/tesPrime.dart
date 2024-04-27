// import 'dart:core';
// import 'dart:math';
//
// void main() {
//   // Kami akan menemukan semua bilangan prima dalam rentang 1 hingga 120
//   // is_prime[i] = 1 berarti bahwa i adalah prima dan is_prime[i] = 0 berarti bahwa i adalah komposit
//   // Pada awalnya, kami mengatakan bahwa semuanya prima
//   var N = BigInt.parse("999999999");
//   // var is_prime = List<int>.filled(N.toInt(), 1);
//   //
//   // // Kami tahu bahwa 0 dan 1 adalah komposit
//   // is_prime[0] = 0;
//   // is_prime[1] = 0;
//
//   // sieve(N, is_prime);
//   // print(is_prime[0]);
//   // print(is_prime[1]);
//   // print(is_prime[2]);
//   // print(is_prime[3]);
//   // print(is_prime[4]);
//   // print(is_prime[5]);
//   // print(is_prime[6]);
//   // print(is_prime[7]);
//
//   print(isPrime(N));
//
//
//   // print(is_prime.last);
//   // print(is_prime[is_prime.length-1]);
//   // print(is_prime.length-1);
//   // print(is_prime.last);
//
//   // for (var i = BigInt.one; i < N; i += BigInt.one) {
//   //   if (is_prime[i.toInt()] == 1) {
//   //     print(i);
//   //   }
//   // }
// }
//
// void sieve(BigInt N, List<int> is_prime) {
//   /*
//   Kami menyilangkan semua komposit dari 2 hingga akar(N)
//   */
//   var i = BigInt.two;
//   // Ini akan berulang dari 2 hingga int(sqrt(x))
//   while (i * i <= N) {
//     // Jika kami sudah menyilangkan angka ini, lanjutkan
//     if (is_prime[i.toInt()] == 0) {
//       i += BigInt.one;
//       continue;
//     }
//
//     var j = BigInt.from(2) * i;
//     while (j < N) {
//       // Silangkan ini karena merupakan komposit
//       is_prime[j.toInt()] = 0;
//       // j ditingkatkan sebesar i, karena kami ingin menutupi semua kelipatan i
//       j += i;
//     }
//
//     i += BigInt.one;
//   }
// }
//
// bool isPrime(BigInt n) {
//   if (n < BigInt.two) return false;
//   for (BigInt i = BigInt.two; i * i <= n; i += BigInt.one) {
//     if (n % i == BigInt.zero) return false;
//   }
//   return true;
// }