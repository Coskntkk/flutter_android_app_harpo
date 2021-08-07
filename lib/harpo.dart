import 'dart:async';

dynamic harpo(input, key, method) {
  List<dynamic> charList = [
    " ",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    ".",
    ",",
    "?",
    "!",
    "-",
    "@",
    "=",
    "_",
    "*",
    "Å",
    "Ä",
    "Ç",
    "Ğ",
    "Ş",
    "Ü",
    "Ö",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    ">",
    "<",
    "a",
    "b",
    "c",
    "ç",
    "d",
    "e",
    "f",
    "g",
    "ğ",
    "h",
    "ı",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "ö",
    "p",
    "q",
    "r",
    "s",
    "ş",
    "t",
    "u",
    "ü",
    "v",
    "w",
    "x",
    "y",
    "z",
    "å",
    "ä",
  ];

  int charListLen = charList.length;
  int inputLen = input.length;

  var charListTemp = [];
  int slide = key;
  if (slide >= charListLen) {
    slide = key % charListLen;
  }

  for (var k = slide; k < charListLen; k++) {
    charListTemp.add(charList[k]);
  }
  for (var k = 0; k < slide; k++) {
    charListTemp.add(charList[k]);
  }
  charList = charListTemp;

  String encryption(message) {
    var code = [];
    for (var z = 0; z < inputLen; z++) {
      for (var x = 0; x < charListLen; x++) {
        if ((charList[x] == message[z]) && (x >= 10)) {
          code.add(x.toString());
        } else if ((charList[x] == message[z]) && (x < 10)) {
          code.add("0$x");
        }
      }
    }
    return code.join('');
  }

  dynamic decryption(code) {
    var codeLen = code.length;
    var message = [];
    var arrayX = [];
    var arrayY = [];

    for (var i = 0; i < codeLen; i++) {
      if (i % 2 == 0) {
        arrayX.add(int.parse(code[i]));
      } else if (i % 2 != 0) {
        arrayY.add(int.parse(code[i]));
      }
    }

    for (var j = 0; j < codeLen / 2; j++) {
      if (arrayX[j] != 0) {
        message.add(charList[(10 * arrayX[j]) + arrayY[j]]);
      } else if (arrayX[j] == 0) {
        message.add(charList[(arrayY[j])]);
      }
    }
    return message.join('');
  }

  if (method == 0) {
    return encryption(input);
  } else if (method == 1) {
    return decryption(input);
  }
}
