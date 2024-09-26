import 'dart:io';

// Funktion zum Konvertieren von Dezimal zu Binär
String decimalToBinary(int number) {
  return number.toRadixString(2);
}

// Funktion zum Konvertieren von Dezimal zu Hexadezimal
String decimalToHex(int number) {
  return number.toRadixString(16).toUpperCase();
}

// Funktion zum Konvertieren von Binär zu Dezimal
int binaryToDecimal(String binary) {
  return int.parse(binary, radix: 2);
}

// Funktion zum Konvertieren von Hexadezimal zu Dezimal
int hexToDecimal(String hex) {
  return int.parse(hex, radix: 16);
}

// Hauptfunktion des Rechners
void main() {
  print('Willkommen beim Multi-Base Taschenrechner!');

  while (true) {
    print('\nWähle den Eingabetyp:');
    print('1. Binär');
    print('2. Dezimal');
    print('3. Hexadezimal');
    print('4. Beenden');

    // Eingabe für den Zahlentyp
    stdout.write('Eingabe: ');
    String? choice = stdin.readLineSync();

    if (choice == null || choice.isEmpty) {
      print('Fehler: Keine Eingabe erkannt. Bitte wähle eine gültige Option.');
      continue; // Starte den Loop erneut
    }

    if (choice == '4') {
      print('Beenden des Rechners...');
      break;
    } else if (choice != '1' && choice != '2' && choice != '3') {
      print('Ungültige Auswahl! Bitte wähle 1, 2, 3 oder 4.');
      continue;
    }

    // Eingabe der ersten Zahl
    stdout.write('Erste Zahl eingeben: ');
    String? input1 = stdin.readLineSync();
    if (input1 == null || input1.isEmpty) {
      print('Fehler: Keine Zahl eingegeben.');
      continue;
    }

    // Eingabe der zweiten Zahl
    stdout.write('Zweite Zahl eingeben: ');
    String? input2 = stdin.readLineSync();
    if (input2 == null || input2.isEmpty) {
      print('Fehler: Keine Zahl eingegeben.');
      continue;
    }

    // Eingabe der Operation
    stdout.write('Operation (+, -, *, /): ');
    String? operation = stdin.readLineSync();
    if (operation == null || operation.isEmpty || !['+', '-', '*', '/'].contains(operation)) {
      print('Ungültige Operation! Bitte wähle +, -, * oder /.');
      continue;
    }

    int num1, num2;

    try {
      switch (choice) {
        case '1': // Binär
          num1 = binaryToDecimal(input1);
          num2 = binaryToDecimal(input2);
          break;
        case '2': // Dezimal
          num1 = int.parse(input1);
          num2 = int.parse(input2);
          break;
        case '3': // Hexadezimal
          num1 = hexToDecimal(input1);
          num2 = hexToDecimal(input2);
          break;
        default:
          print('Ungültige Auswahl!');
          continue;
      }

      int result;
      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            print('Fehler: Division durch Null ist nicht erlaubt.');
            continue;
          }
          result = num1 ~/ num2; // Ganzzahldivision
          break;
        default:
          print('Ungültige Operation! Bitte wähle +, -, * oder /.');
          continue;
      }

      print('\nErgebnis:');
      print('Dezimal: $result');
      print('Binär: ${decimalToBinary(result)}');
      print('Hexadezimal: ${decimalToHex(result)}');
    } catch (e) {
      print('Fehler bei der Berechnung: ${e.toString()}');
    }
  }
}


//version 2.0

// while (true) {
//   print('\nWähle den Eingabetyp:');
//   print('1. Binär');
//   print('2. Dezimal');
//   print('3. Hexadezimal');
//   print('4. Beenden');

//   stdout.write('Eingabe: ');
//   String? choice = stdin.readLineSync();

//   if (choice == '4') {
//     print('Beenden des Rechners...');
//     break;
//   }

//   // Eingabe der ersten Zahl
//   stdout.write('Erste Zahl eingeben: ');
//   String? input1 = stdin.readLineSync();
//   if (input1 == null || input1.isEmpty) {
//     print('Fehler: Keine Zahl eingegeben.');
//     continue;
//   }

//   // Eingabe der zweiten Zahl
//   stdout.write('Zweite Zahl eingeben: ');
//   String? input2 = stdin.readLineSync();
//   if (input2 == null || input2.isEmpty) {
//     print('Fehler: Keine Zahl eingegeben.');
//     continue;
//   }

//   if (choice == '1' && (!isValidBinary(input1) || !isValidBinary(input2))) {
//     print('Ungültige Binärzahl.');
//     continue;
//   } else if (choice == '3' && (!isValidHex(input1) || !isValidHex(input2))) {
//     print('Ungültige Hexadezimalzahl.');
//     continue;
//   }

//   // ... (restlicher Code bleibt gleich)
// }
