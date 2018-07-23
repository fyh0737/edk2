//#pragma pack(1)

#ifndef __TEST_H__
#define __TEST_H__

#define MacroTest2 10

typedef struct {
  BOOLEAN  Bool;
  UINT8    A:4;
  UINT8    B:4;
  UINT32   Unaligned32;
  UINT16   C;
  UINT16   D;
  UINT32   E;
  UINT32   F;
  UINT64   G;
  UINT64   H;
  UINT8    Reserved;
  UINT8    Hidden;
  UINT8    OneLine8;
  UINT16   OneLine16;
  UINT32   OneLine32;
  UINT64   OneLine64;
  BOOLEAN  OneLineBoolA;
  BOOLEAN  OneLineBoolB;
  BOOLEAN  OneLineBoolC;
  BOOLEAN  OneLineBoolD;
  UINT16   Array[20];
  UINT8    Array2[10];
  UINT8    FlexibleArray[0];
} TEST;

//#pragma pack()

#endif
